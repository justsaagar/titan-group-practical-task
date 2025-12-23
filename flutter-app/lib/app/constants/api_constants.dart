class ApiConstants {
  ApiConstants._();

  // Change this to your PHP API URL
  // For local development with PHP built-in server: http://localhost:8000
  // For Android emulator: http://10.0.2.2:8000
  // For iOS simulator: http://localhost:8000
  // For physical device: http://YOUR_COMPUTER_IP:8000
  static const String baseUrl = 'http://localhost:8000';
  
  static const String itemsEndpoint = '/api/items';
  static const String healthEndpoint = '/api/health';
  
  static String getItemsUrl() => '$baseUrl$itemsEndpoint';
  static String getItemUrl(int id) => '$baseUrl$itemsEndpoint/$id';
  static String getHealthUrl() => '$baseUrl$healthEndpoint';
}

