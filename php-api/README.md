# PHP RESTful API

A simple RESTful API built with PHP that returns JSON data for demonstration purposes.

## Features

- RESTful API endpoints
- JSON response format
- CORS enabled for cross-origin requests
- Sample data (items/products)
- Health check endpoint

## Requirements

- PHP 7.0 or higher
- Apache server with mod_rewrite enabled (or use PHP built-in server)

## Setup Instructions

### Using PHP Built-in Server (Recommended for Development)

1. Navigate to the php-api directory:
```bash
cd php-api
```

2. Start the PHP server:
```bash
php -S localhost:8000
```

The API will be available at `http://localhost:8000`

### Using Apache Server

1. Place the `php-api` folder in your Apache web directory (e.g., `htdocs`, `www`, or `/var/www/html`)
2. Ensure mod_rewrite is enabled
3. Access via `http://localhost/php-api` or your configured domain

## API Endpoints

### Get All Items
```
GET /api/items
```
Returns a list of all items.

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "Laptop Computer",
      "category": "Electronics",
      "price": 999.99,
      "description": "High-performance laptop for work and gaming",
      "inStock": true,
      "rating": 4.5
    },
    ...
  ],
  "count": 8
}
```

### Get Single Item by ID
```
GET /api/items/{id}
```
Returns a single item by its ID.

**Example:**
```
GET /api/items/1
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Laptop Computer",
    "category": "Electronics",
    "price": 999.99,
    "description": "High-performance laptop for work and gaming",
    "inStock": true,
    "rating": 4.5
  }
}
```

### Health Check
```
GET /api/health
```
Returns API status.

**Response:**
```json
{
  "success": true,
  "message": "API is running",
  "timestamp": "2024-01-01 12:00:00"
}
```

## Testing the API

You can test the API using:

1. **Browser**: Navigate to `http://localhost:8000/api/items`
2. **cURL**:
```bash
curl http://localhost:8000/api/items
```
3. **Postman**: Import the endpoints and test them

## Notes

- The API uses CORS headers to allow cross-origin requests
- All responses are in JSON format
- Error responses include appropriate HTTP status codes

