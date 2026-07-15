<?php
/**
 * WHMCS Favicon.ico 500 Error Fix Hook
 * 
 * Intercepts requests rewritten to index.php?rp=/favicon.ico
 * and returns a clean HTTP 200 response with image/x-icon content type,
 * preventing WHMCS router from throwing 500 Internal Server Errors.
 */

$requestPath = '';
if (isset($_GET['rp'])) {
    $requestPath = $_GET['rp'];
} elseif (isset($_SERVER['REQUEST_URI'])) {
    $requestPath = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
}

// Remove trailing slash if any
$requestPath = rtrim($requestPath, '/');

if (strpos($requestPath, 'favicon.ico') !== false) {
    // Clear any previous output buffers to ensure a clean response
    while (ob_get_level()) {
        ob_end_clean();
    }

    // Set headers for favicon and return 200 OK
    header('Content-Type: image/x-icon');
    http_response_code(200);
    
    // Output an empty string (standard and perfectly supported by modern browsers)
    echo '';
    exit;
}
