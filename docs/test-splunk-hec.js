/**
 * Test script for Splunk HEC connection
 * Run this in Node.js to test your Splunk HEC setup
 */

const https = require('https');

// Configuration - UPDATE THESE VALUES
const SPLUNK_ENDPOINT = 'https://splunk-instance.nhs.uk:8088/services/collector';
const SPLUNK_TOKEN = 'hec-token-placeholder';

// Test event data
const testEvent = {
    event: {
        timestamp: new Date().toISOString(),
        session_id: 'test_session_123',
        environment: 'test',
        user_agent: 'Test Script',
        page_url: 'http://localhost:4000/test',
        page_title: 'Test Page',
        page_path: '/test',
        referrer: 'http://localhost:4000/',
        event_type: 'test_event',
        event_category: 'test',
        event_action: 'test',
        event_label: 'HEC Test',
        event_value: 1,
        test_message: 'This is a test event from NHS Notify Web CMS'
    },
    sourcetype: 'nhs_notify_frontend_events',
    index: 'events_nhsnotify_nonprod',
    host: 'test-host'
};

// Function to send test event
function sendTestEvent() {
    const postData = JSON.stringify(testEvent);

    const options = {
        hostname: new URL(SPLUNK_ENDPOINT).hostname,
        port: new URL(SPLUNK_ENDPOINT).port || 443,
        path: new URL(SPLUNK_ENDPOINT).pathname,
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Splunk ${SPLUNK_TOKEN}`,
            'Content-Length': Buffer.byteLength(postData)
        }
    };

    const req = https.request(options, (res) => {
        console.log(`Status: ${res.statusCode}`);
        console.log(`Headers: ${JSON.stringify(res.headers)}`);

        let data = '';
        res.on('data', (chunk) => {
            data += chunk;
        });

        res.on('end', () => {
            console.log('Response:', data);
            if (res.statusCode === 200) {
                console.log('✅ SUCCESS: Test event sent to Splunk successfully!');
                console.log('Check your Splunk index "events_nhsnotify_nonprod" for the test event.');
            } else {
                console.log('❌ FAILED: Test event failed to send to Splunk.');
            }
        });
    });

    req.on('error', (err) => {
        console.error('❌ ERROR:', err.message);
        console.log('Check your Splunk endpoint and token configuration.');
    });

    req.write(postData);
    req.end();
}

// Run the test
console.log('🚀 Testing Splunk HEC connection...');
console.log('Endpoint:', SPLUNK_ENDPOINT);
console.log('Token:', SPLUNK_TOKEN.substring(0, 10) + '...');
console.log('');

sendTestEvent();
