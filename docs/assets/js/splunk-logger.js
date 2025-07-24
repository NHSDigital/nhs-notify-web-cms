/**
 * Splunk Logger for NHS Notify Web CMS
 * Sends frontend events to Splunk index: events_nhsnotify_nonprod
 */

class SplunkLogger {
    constructor() {
        this.splunkEndpoint = this.getSplunkEndpoint();
        this.environment = this.getEnvironment();
        this.sessionId = this.generateSessionId();
        this.userAgent = navigator.userAgent;
        this.timestamp = new Date().toISOString();

        // Initialize event listeners
        this.initializeEventListeners();
    }

    /**
     * Get Splunk endpoint from environment or use default
     */
    getSplunkEndpoint() {
        // In production, this would be configured via environment variables
        // For now, using a placeholder that should be replaced with actual Splunk HTTP Event Collector
        return window.SPLUNK_ENDPOINT || 'https://your-splunk-hec-endpoint.com/services/collector';
    }

    /**
     * Get current environment
     */
    getEnvironment() {
        const hostname = window.location.hostname;
        if (hostname.includes('localhost') || hostname.includes('127.0.0.1')) {
            return 'development';
        } else if (hostname.includes('staging') || hostname.includes('test')) {
            return 'staging';
        } else {
            return 'production';
        }
    }

    /**
     * Generate unique session ID
     */
    generateSessionId() {
        let sessionId = sessionStorage.getItem('nhs_notify_session_id');
        if (!sessionId) {
            sessionId = 'session_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
            sessionStorage.setItem('nhs_notify_session_id', sessionId);
        }
        return sessionId;
    }

    /**
     * Get current page information
     */
    getPageInfo() {
        return {
            url: window.location.href,
            pathname: window.location.pathname,
            title: document.title,
            referrer: document.referrer
        };
    }

        /**
     * Send event to Splunk
     */
    async sendToSplunk(eventData) {
        const logEvent = {
            // Splunk HEC format
            event: {
                // Event metadata
                timestamp: new Date().toISOString(),
                session_id: this.sessionId,
                environment: this.environment,
                user_agent: this.userAgent,

                // Page information
                page_url: window.location.href,
                page_title: document.title,
                page_path: window.location.pathname,
                referrer: document.referrer,

                // Custom event data
                event_type: eventData.type,
                event_category: eventData.category,
                event_action: eventData.action,
                event_label: eventData.label,
                event_value: eventData.value,

                // Additional context
                ...eventData.additionalData
            },
            // Splunk metadata
            sourcetype: 'nhs_notify_frontend_events',
            index: 'events_nhsnotify_nonprod',
            host: window.location.hostname
        };

        // In development environment, log to console instead of sending to Splunk
        if (this.environment === 'development' || window.location.hostname.includes('localhost')) {
            console.log('🔍 SPLUNK LOG EVENT:', {
                timestamp: logEvent.event.timestamp,
                session_id: logEvent.event.session_id,
                environment: logEvent.event.environment,
                event_type: logEvent.event.event_type,
                event_category: logEvent.event.event_category,
                event_action: logEvent.event.event_action,
                event_label: logEvent.event.event_label,
                page_url: logEvent.event.page_url,
                page_title: logEvent.event.page_title,
                additional_data: logEvent.event.additionalData || {}
            });
            return;
        }

        try {
            const response = await fetch(this.splunkEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Splunk ${window.SPLUNK_TOKEN || 'your-splunk-token'}`
                },
                body: JSON.stringify(logEvent)
            });

            if (!response.ok) {
                console.warn('Splunk logging failed:', response.status, response.statusText);
            }
        } catch (error) {
            console.warn('Splunk logging error:', error);
        }
    }

    /**
     * Log page view event
     */
    logPageView(pageData = {}) {
        const eventData = {
            type: 'page_view',
            category: 'navigation',
            action: 'page_load',
            label: document.title,
            value: 1,
            additionalData: {
                page_section: this.getPageSection(),
                page_subsection: this.getPageSubsection(),
                ...pageData
            }
        };

        this.sendToSplunk(eventData);
    }

    /**
     * Log link click event
     */
    logLinkClick(linkElement, linkData = {}) {
        const eventData = {
            type: 'link_click',
            category: 'navigation',
            action: 'click',
            label: linkElement.textContent?.trim() || linkElement.href,
            value: 1,
            additionalData: {
                link_url: linkElement.href,
                link_text: linkElement.textContent?.trim(),
                link_target: linkElement.target || '_self',
                link_rel: linkElement.rel,
                is_external: this.isExternalLink(linkElement.href),
                ...linkData
            }
        };

        this.sendToSplunk(eventData);
    }

    /**
     * Log sidebar navigation event
     */
    logSidebarNavigation(navData = {}) {
        const eventData = {
            type: 'sidebar_navigation',
            category: 'navigation',
            action: 'sidebar_click',
            label: navData.section || 'unknown',
            value: 1,
            additionalData: {
                sidebar_section: navData.section,
                sidebar_item: navData.item,
                sidebar_order: navData.order,
                ...navData
            }
        };

        this.sendToSplunk(eventData);
    }

    /**
     * Log search event
     */
    logSearch(searchData = {}) {
        const eventData = {
            type: 'search',
            category: 'interaction',
            action: 'search',
            label: searchData.query || 'unknown',
            value: 1,
            additionalData: {
                search_query: searchData.query,
                search_results_count: searchData.resultsCount,
                search_duration: searchData.duration,
                ...searchData
            }
        };

        this.sendToSplunk(eventData);
    }

    /**
     * Log form interaction event
     */
    logFormInteraction(formData = {}) {
        const eventData = {
            type: 'form_interaction',
            category: 'interaction',
            action: formData.action || 'interact',
            label: formData.formName || 'unknown',
            value: 1,
            additionalData: {
                form_name: formData.formName,
                form_action: formData.formAction,
                form_method: formData.formMethod,
                field_name: formData.fieldName,
                field_type: formData.fieldType,
                ...formData
            }
        };

        this.sendToSplunk(eventData);
    }

    /**
     * Get current page section
     */
    getPageSection() {
        const path = window.location.pathname;
        const pathParts = path.split('/').filter(part => part);

        if (pathParts.length > 0) {
            return pathParts[0];
        }
        return 'home';
    }

    /**
     * Get current page subsection
     */
    getPageSubsection() {
        const path = window.location.pathname;
        const pathParts = path.split('/').filter(part => part);

        if (pathParts.length > 1) {
            return pathParts[1];
        }
        return null;
    }

    /**
     * Check if link is external
     */
    isExternalLink(url) {
        try {
            const linkHost = new URL(url).hostname;
            const currentHost = window.location.hostname;
            return linkHost !== currentHost;
        } catch {
            return false;
        }
    }

    /**
     * Initialize event listeners
     */
    initializeEventListeners() {
        // Page view tracking
        this.logPageView();

        // Link click tracking
        document.addEventListener('click', (event) => {
            const link = event.target.closest('a');
            if (link) {
                this.logLinkClick(link);
            }
        });

        // Sidebar navigation tracking
        document.addEventListener('click', (event) => {
            const sidebarLink = event.target.closest('.nhsnotify-side-nav__link');
            if (sidebarLink) {
                const section = this.getSidebarSection(sidebarLink);
                const item = sidebarLink.textContent?.trim();
                this.logSidebarNavigation({
                    section: section,
                    item: item,
                    url: sidebarLink.href
                });
            }
        });

        // Form interaction tracking
        document.addEventListener('change', (event) => {
            if (event.target.tagName === 'INPUT' || event.target.tagName === 'SELECT' || event.target.tagName === 'TEXTAREA') {
                const form = event.target.closest('form');
                this.logFormInteraction({
                    formName: form?.name || 'unknown',
                    formAction: form?.action,
                    formMethod: form?.method,
                    fieldName: event.target.name,
                    fieldType: event.target.type,
                    action: 'field_change'
                });
            }
        });

        // Search tracking (if search functionality exists)
        const searchForm = document.querySelector('form[role="search"]');
        if (searchForm) {
            searchForm.addEventListener('submit', (event) => {
                const searchInput = searchForm.querySelector('input[type="search"], input[name*="search"]');
                if (searchInput) {
                    this.logSearch({
                        query: searchInput.value,
                        formName: searchForm.name || 'search'
                    });
                }
            });
        }
    }

    /**
     * Get sidebar section from link
     */
    getSidebarSection(link) {
        const sidebarItem = link.closest('.nhsnotify-side-nav__item');
        if (sidebarItem) {
            const sectionHeader = sidebarItem.previousElementSibling;
            if (sectionHeader && sectionHeader.classList.contains('nhsnotify-side-nav__list-section')) {
                return sectionHeader.textContent?.trim();
            }
        }
        return 'unknown';
    }
}

// Initialize Splunk logger when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    window.splunkLogger = new SplunkLogger();
});

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SplunkLogger;
}
