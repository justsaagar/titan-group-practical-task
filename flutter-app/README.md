# Flutter API Demo App

A Flutter application that fetches and displays data from a PHP RESTful API.

## Features

- ✅ Fetches data from PHP API
- ✅ Displays items in a clean ListView
- ✅ Loading indicator while fetching data
- ✅ Error handling with retry functionality
- ✅ Pull-to-refresh support
- ✅ Clean, modern UI design
- ✅ Android and iOS support (no web)

## Requirements

- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- PHP API running (see php-api/README.md)

## Setup Instructions

### 1. Install Dependencies

```bash
cd flutter-app
flutter pub get
```

### 2. Configure API URL

Open `lib/app/constants/api_constants.dart` and update the `baseUrl` based on your setup:

- **Local development (iOS Simulator)**: `http://localhost:8000`
- **Android Emulator**: `http://10.0.2.2:8000`
- **Physical Device**: `http://YOUR_COMPUTER_IP:8000` (e.g., `http://192.168.1.100:8000`)

To find your computer's IP address:
- **macOS/Linux**: Run `ifconfig` or `ip addr`
- **Windows**: Run `ipconfig`

### 3. Start the PHP API

Make sure the PHP API is running before starting the Flutter app. See `../php-api/README.md` for instructions.

### 4. Run the App

```bash
# For Android
flutter run

# For iOS
flutter run

# For specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

## Project Structure

```
lib/
├── app/
│   ├── constants/
│   │   ├── api_constants.dart    # API endpoints configuration
│   │   ├── app_colors.dart        # App color constants
│   │   └── app_strings.dart       # App string constants
│   ├── controllers/
│   │   └── items_controller.dart  # State management for items
│   ├── models/
│   │   └── item_model.dart        # Item data model
│   ├── routes/
│   │   ├── app_pages.dart         # Route definitions
│   │   └── app_routes.dart        # Route constants
│   └── services/
│       └── api_service.dart       # API service for HTTP requests
├── screen/
│   ├── bindings/
│   │   └── home_binding.dart      # Dependency injection binding
│   └── home_screen.dart           # Main screen with items list
└── main.dart                      # App entry point
```

## Dependencies

- **get**: State management and dependency injection
- **http**: HTTP client for API requests
- **google_fonts**: Beautiful typography
- **intl**: Internationalization and number formatting

## Features Explained

### Loading State
When data is being fetched, a circular progress indicator is shown with a loading message.

### Error Handling
If an error occurs (network issue, API down, etc.), an error screen is displayed with:
- Error icon
- Error message
- Retry button

### Pull to Refresh
Users can pull down on the list to refresh the data.

### Item Display
Each item card shows:
- Item name and category
- Description
- Stock status (In Stock/Out of Stock)
- Rating with star icon
- Price formatted as currency

## Troubleshooting

### API Connection Issues

1. **Check if PHP API is running**: Visit `http://localhost:8000/api/items` in your browser
2. **Verify API URL**: Check `api_constants.dart` matches your setup
3. **Check network permissions**: Ensure your device/emulator can access the API URL
4. **CORS issues**: The PHP API includes CORS headers, but if issues persist, check the API configuration

### Android Emulator Network

If using Android emulator, use `10.0.2.2` instead of `localhost` to access your host machine.

### iOS Simulator Network

iOS simulator can use `localhost` directly.

## Notes

- This app is configured for Android and iOS only (no web support)
- The app uses GetX for state management
- All API calls include timeout handling (10 seconds)
- Error messages are user-friendly

