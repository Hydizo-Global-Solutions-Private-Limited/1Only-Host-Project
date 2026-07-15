<?php
/**
 * Temporary Debug Hook to inspect API v2 requests
 */

$requestPath = '';
if (isset($_GET['rp'])) {
    $requestPath = $_GET['rp'];
} elseif (isset($_SERVER['REQUEST_URI'])) {
    $requestPath = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
}

if (strpos($requestPath, 'api/v2') !== false) {
    $logFile = __DIR__ . '/debug.log';
    $headers = [];
    if (function_exists('getallheaders')) {
        $headers = getallheaders();
    } else {
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
    }
    $logData = [
        'time' => date('Y-m-d H:i:s'),
        'requestPath' => $requestPath,
        'method' => $_SERVER['REQUEST_METHOD'] ?? '',
        'headers' => $headers,
        'cookies' => $_COOKIE,
        'session' => $_SESSION ?? [],
        'get' => $_GET,
        'post' => $_POST,
    ];
    file_put_contents($logFile, json_encode($logData, JSON_PRETTY_PRINT) . "\n\n", FILE_APPEND);
}
