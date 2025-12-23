<?php
/**
 * Simple RESTful API for Demo Application
 * Returns JSON data for items/users/records
 */

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Get the request method and path
$method = $_SERVER['REQUEST_METHOD'];
$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$path = rtrim($path, '/');

// Sample data
$items = [
    [
        'id' => 1,
        'name' => 'Laptop Computer',
        'category' => 'Electronics',
        'price' => 999.99,
        'description' => 'High-performance laptop for work and gaming',
        'inStock' => true,
        'rating' => 4.5
    ],
    [
        'id' => 2,
        'name' => 'Wireless Mouse',
        'category' => 'Electronics',
        'price' => 29.99,
        'description' => 'Ergonomic wireless mouse with long battery life',
        'inStock' => true,
        'rating' => 4.2
    ],
    [
        'id' => 3,
        'name' => 'Mechanical Keyboard',
        'category' => 'Electronics',
        'price' => 149.99,
        'description' => 'RGB backlit mechanical keyboard with blue switches',
        'inStock' => false,
        'rating' => 4.7
    ],
    [
        'id' => 4,
        'name' => 'USB-C Hub',
        'category' => 'Accessories',
        'price' => 49.99,
        'description' => 'Multi-port USB-C hub with HDMI and card reader',
        'inStock' => true,
        'rating' => 4.0
    ],
    [
        'id' => 5,
        'name' => 'Monitor Stand',
        'category' => 'Accessories',
        'price' => 79.99,
        'description' => 'Adjustable monitor stand with cable management',
        'inStock' => true,
        'rating' => 4.3
    ],
    [
        'id' => 6,
        'name' => 'Webcam HD',
        'category' => 'Electronics',
        'price' => 89.99,
        'description' => '1080p HD webcam with auto-focus and microphone',
        'inStock' => true,
        'rating' => 4.4
    ],
    [
        'id' => 7,
        'name' => 'Desk Lamp',
        'category' => 'Furniture',
        'price' => 39.99,
        'description' => 'LED desk lamp with adjustable brightness',
        'inStock' => true,
        'rating' => 4.1
    ],
    [
        'id' => 8,
        'name' => 'Laptop Stand',
        'category' => 'Accessories',
        'price' => 59.99,
        'description' => 'Aluminum laptop stand for better ergonomics',
        'inStock' => false,
        'rating' => 4.6
    ]
];

// Route handling
if ($method === 'GET') {
    // Get all items
    if ($path === '/api/items' || $path === '/api/items.php' || $path === '' || $path === '/') {
        echo json_encode([
            'success' => true,
            'data' => $items,
            'count' => count($items)
        ]);
        exit();
    }
    
    // Get single item by ID
    if (preg_match('/^\/api\/items\/(\d+)$/', $path, $matches)) {
        $id = (int)$matches[1];
        $item = null;
        
        foreach ($items as $it) {
            if ($it['id'] === $id) {
                $item = $it;
                break;
            }
        }
        
        if ($item) {
            echo json_encode([
                'success' => true,
                'data' => $item
            ]);
        } else {
            http_response_code(404);
            echo json_encode([
                'success' => false,
                'message' => 'Item not found'
            ]);
        }
        exit();
    }
    
    // Health check endpoint
    if ($path === '/api/health' || $path === '/api/health.php') {
        echo json_encode([
            'success' => true,
            'message' => 'API is running',
            'timestamp' => date('Y-m-d H:i:s')
        ]);
        exit();
    }
}

// Handle unsupported methods
http_response_code(405);
echo json_encode([
    'success' => false,
    'message' => 'Method not allowed'
]);

