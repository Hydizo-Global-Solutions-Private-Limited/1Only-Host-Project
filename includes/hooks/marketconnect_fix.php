<?php
/**
 * WHMCS MarketConnect & Checkout API Override Hook
 * 
 * Intercepts requests targeting store/products and cart/{id}/checkout
 * to prevent HTTP 500 Internal Server Errors on the Vue-based order form cart pages.
 * Returns valid JSON structures that the frontend expects.
 */

$requestPath = '';
if (isset($_GET['rp'])) {
    $requestPath = $_GET['rp'];
} elseif (isset($_SERVER['REQUEST_URI'])) {
    $requestPath = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
}

// Remove trailing slash if any
$requestPath = rtrim($requestPath, '/');

$isStoreProductsApi = (strpos($requestPath, 'store/products') !== false);
$isCheckoutApi = (strpos($requestPath, 'cart/') !== false && substr($requestPath, -9) === '/checkout');

if ($isStoreProductsApi) {
    // Clear any previous output buffers to ensure a clean JSON response
    while (ob_get_level()) {
        ob_end_clean();
    }

    // Set JSON headers and exit with empty array wrapped in 'data' key
    header('Content-Type: application/json; charset=utf-8');
    http_response_code(200);
    echo json_encode([
        'data' => []
    ]);
    exit;
}

if ($isCheckoutApi) {
    // Clear any previous output buffers to ensure a clean JSON response
    while (ob_get_level()) {
        ob_end_clean();
    }

    // Set JSON headers and exit with standard checkout URL wrapped in 'data' key
    header('Content-Type: application/json; charset=utf-8');
    http_response_code(200);
    echo json_encode([
        'data' => [
            'url' => '/cart.php?a=checkout'
        ]
    ]);
    exit;
}
