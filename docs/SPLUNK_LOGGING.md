# Splunk Logging for NHS Notify Web CMS

This document explains how to set up and configure Splunk logging for frontend events in the NHS Notify Web CMS.

## Overview

The Splunk logging system tracks user interactions and navigation events on the NHS Notify website and sends them to Splunk for analysis. Events are sent to the `events_nhsnotify_nonprod` index in non-production environments.

## Features

### Tracked Events

- **Page Views**: When users visit pages
- **Link Clicks**: When users click on links (internal and external)
- **Sidebar Navigation**: When users navigate using the sidebar
- **Search**: When users perform searches (if search functionality exists)
- **Form Interactions**: When users interact with form fields
- **Button Clicks**: When users click buttons
- **File Downloads**: When users download files
- **External Link Clicks**: When users click links to external sites

### Event Data

Each event includes:
- Timestamp
- Session ID (unique per browser session)
- Environment (development/staging/production)
- User Agent
- Page URL and title
- Referrer
- Event type, category, action, and label
- Additional contextual data

## Configuration

### Environment Setup

Edit `docs/_data/splunk-config.yml` to configure Splunk settings for each environment:

```yaml
environments:
  development:
    enabled: false  # Disable in development
    endpoint: "https://dev-splunk-hec.nhs.uk/services/collector"
    token: "your-dev-token"
    index: "events_nhsnotify_nonprod"

  staging:
    enabled: true
    endpoint: "https://staging-splunk-hec.nhs.uk/services/collector"
    token: "your-staging-token"
    index: "events_nhsnotify_nonprod"

  production:
    enabled: true
    endpoint: "https://prod-splunk-hec.nhs.uk/services/collector"
    token: "your-prod-token"
    index: "events_nhsnotify_prod"
```

### Splunk HTTP Event Collector (HEC) Setup

1. **Configure HEC in Splunk**:
   - Enable HTTP Event Collector in Splunk
   - Create a new token for the NHS Notify application
   - Configure the index as `events_nhsnotify_nonprod`

2. **Update Configuration**:
   - Replace placeholder endpoints with actual Splunk HEC URLs
   - Replace placeholder tokens with actual HEC tokens
   - Ensure the correct index is specified

## Implementation Details

### Files

- `docs/assets/js/splunk-logger.js`: Main logging implementation
- `docs/_data/splunk-config.yml`: Configuration settings
- `docs/_layouts/default.html`: Template integration

### How It Works

1. **Initialization**: The logger initializes when the DOM loads
2. **Event Listeners**: Automatically attaches listeners for various user interactions
3. **Data Collection**: Captures relevant event data and page information
4. **Splunk Format**: Formats events according to Splunk HEC requirements
5. **HTTP POST**: Sends events to Splunk via HTTP POST requests

### Event Format

Events are sent in Splunk HEC format:

```json
{
  "event": {
    "timestamp": "2024-01-15T10:30:00.000Z",
    "session_id": "session_1705312200000_abc123",
    "environment": "staging",
    "user_agent": "Mozilla/5.0...",
    "page_url": "https://notify.nhs.uk/features",
    "page_title": "Features - NHS Notify",
    "page_path": "/features",
    "referrer": "https://notify.nhs.uk/",
    "event_type": "link_click",
    "event_category": "navigation",
    "event_action": "click",
    "event_label": "Emails",
    "event_value": 1,
    "link_url": "https://notify.nhs.uk/features/emails",
    "link_text": "Emails",
    "is_external": false
  },
  "sourcetype": "nhs_notify_frontend_events",
  "index": "events_nhsnotify_nonprod",
  "host": "notify.nhs.uk"
}
```

## Usage Examples

### Manual Event Logging

You can manually log events from JavaScript:

```javascript
// Log a custom event
window.splunkLogger.logPageView({
  custom_data: "additional information"
});

// Log a link click
window.splunkLogger.logLinkClick(linkElement, {
  custom_context: "sidebar navigation"
});

// Log sidebar navigation
window.splunkLogger.logSidebarNavigation({
  section: "Features",
  item: "Emails",
  url: "/features/emails"
});
```

### Custom Event Tracking

Add custom event tracking for specific interactions:

```javascript
// Track button clicks
document.querySelector('.cta-button').addEventListener('click', function() {
  window.splunkLogger.sendToSplunk({
    type: 'button_click',
    category: 'conversion',
    action: 'click',
    label: 'Get Started Button',
    additionalData: {
      button_text: this.textContent,
      button_location: 'hero_section'
    }
  });
});
```

## Splunk Queries

### Common Search Queries

```splunk
# All frontend events
index=events_nhsnotify_nonprod sourcetype=nhs_notify_frontend_events

# Page views by section
index=events_nhsnotify_nonprod sourcetype=nhs_notify_frontend_events event_type=page_view | stats count by page_section

# Link clicks by destination
index=events_nhsnotify_nonprod sourcetype=nhs_notify_frontend_events event_type=link_click | stats count by link_url

# Sidebar navigation usage
index=events_nhsnotify_nonprod sourcetype=nhs_notify_frontend_events event_type=sidebar_navigation | stats count by sidebar_section, sidebar_item

# User journey analysis
index=events_nhsnotify_nonprod sourcetype=nhs_notify_frontend_events | transaction session_id | stats count by page_path
```

## Security Considerations

1. **Token Security**: Keep HEC tokens secure and rotate regularly
2. **Data Privacy**: Ensure no PII is logged in events
3. **CORS**: Configure CORS settings in Splunk to allow requests from your domain
4. **Rate Limiting**: Implement rate limiting to prevent abuse

## Troubleshooting

### Common Issues

1. **Events not appearing in Splunk**:
   - Check HEC endpoint and token
   - Verify index exists and is accessible
   - Check browser console for errors

2. **CORS errors**:
   - Configure CORS settings in Splunk
   - Ensure domain is whitelisted

3. **Events not being sent**:
   - Check if logging is enabled for the environment
   - Verify JavaScript is loading correctly
   - Check network tab for failed requests

### Debug Mode

Enable debug logging by adding to browser console:

```javascript
// Enable debug mode
window.splunkLogger.debug = true;
```

## Development

### Local Development

For local development, logging is disabled by default. To enable:

1. Update `docs/_data/splunk-config.yml`
2. Set `enabled: true` for development environment
3. Configure a test HEC endpoint

### Testing

Test the logging implementation:

1. Open browser developer tools
2. Navigate to different pages
3. Click links and interact with forms
4. Check network tab for requests to Splunk endpoint
5. Verify events appear in Splunk

## Support

For issues with Splunk logging:
1. Check browser console for JavaScript errors
2. Verify Splunk configuration
3. Test with a simple event first
4. Contact the development team for assistance
