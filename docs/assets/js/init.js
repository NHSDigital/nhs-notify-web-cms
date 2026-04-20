// Add classes to body for progressive enhancement
document.body.className += ' js-enabled' + ('noModule' in HTMLScriptElement.prototype ? ' nhsuk-frontend-supported' : '');

// Initialize NHS UK Frontend components
import { initAll } from './nhsuk-frontend.min.js';
initAll();
