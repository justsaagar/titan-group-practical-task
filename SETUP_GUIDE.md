# Setup Guide - PHP API & Flutter App

This guide will help you set up and run both the PHP API and Flutter application.

## Prerequisites

- PHP 7.0 or higher
- Flutter SDK 3.0.0 or higher
- Android Studio / Xcode (for mobile development)
- Android Emulator or iOS Simulator (or physical device)

## Part 1: PHP API Setup

### Step 1: Navigate to PHP API Directory

```bash
cd "Tital group practical task/php-api"
```

### Step 2: Start PHP Server

**Option A: Using PHP Built-in Server (Recommended)**
```bash
php -S localhost:8000
```

**Option B: Using Apache/XAMPP**
- Copy the `php-api` folder to your Apache `htdocs` directory
- Access via `http://localhost/php-api`

### Step 3: Test the API

Open your browser and visit:
- `http://localhost:8000/api/items` - Should return JSON data
- `http://localhost:8000/api/health` - Should return API status

You should see JSON responses. Keep the PHP server running!

## Part 2: Flutter App Setup

### Step 1: Navigate to Flutter App Directory

```bash
cd "Tital group practical task/flutter-app"
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

### Step 3: Configure API URL

**Important:** You need to update the API URL based on your setup.

Open `lib/app/constants/api_constants.dart` and modify the `baseUrl`:

**For iOS Simulator:**
```dart
static const String baseUrl = 'http://localhost:8000';
```

**For Android Emulator:**
```dart
static const String baseUrl = 'http://10.0.2.2:8000';
```

**For Physical Device:**
1. Find your computer's IP address:
   - **macOS/Linux**: Run `ifconfig` in terminal
   - **Windows**: Run `ipconfig` in command prompt
   - Look for IPv4 address (e.g., `192.168.1.100`)

2. Update the URL:
```dart
static const String baseUrl = 'http://192.168.1.100:8000';
```

**Important:** Make sure your computer and device are on the same WiFi network!

### Step 4: Check Available Devices

```bash
flutter devices
```

You should see available emulators/simulators or connected devices.

### Step 5: Run the App

**For Android:**
```bash
flutter run
```

**For iOS (macOS only):**
```bash
flutter run
```

**For specific device:**
```bash
flutter run -d <device-id>
```

## Troubleshooting

### PHP API Issues

1. **Port already in use:**
   - Change the port: `php -S localhost:8001`
   - Update Flutter app's `api_constants.dart` accordingly

2. **CORS errors:**
   - The PHP API includes CORS headers, but if issues persist, check `.htaccess` file

### Flutter App Issues

1. **Cannot connect to API:**
   - Verify PHP server is running
   - Check API URL in `api_constants.dart`
   - For Android emulator, use `10.0.2.2` instead of `localhost`
   - For physical device, ensure same WiFi network

2. **Network security errors (Android):**
   - The `AndroidManifest.xml` includes `usesCleartextTraffic="true"` for HTTP support
   - If issues persist, check Android network security config

3. **iOS network errors:**
   - The `Info.plist` includes `NSAllowsArbitraryLoads` for HTTP support
   - Ensure Info.plist is properly configured

4. **Dependencies not found:**
   - Run `flutter pub get` again
   - Run `flutter clean` then `flutter pub get`

### Testing API Connection

Before running Flutter app, test API connection:

**Using cURL:**
```bash
curl http://localhost:8000/api/items
```

**Using Browser:**
Visit `http://localhost:8000/api/items` - you should see JSON data

## Project Structure

```
Tital group practical task/
├── php-api/
│   ├── index.php          # Main API file
│   ├── .htaccess          # Apache configuration
│   └── README.md          # PHP API documentation
│
└── flutter-app/
    ├── lib/
    │   ├── app/           # App configuration
    │   │   ├── constants/ # Constants (colors, strings, API URLs)
    │   │   ├── controllers/ # State management
    │   │   ├── models/    # Data models
    │   │   ├── routes/    # Navigation routes
    │   │   └── services/  # API service
    │   ├── screen/        # UI screens
    │   └── main.dart      # App entry point
    ├── android/           # Android configuration
    ├── ios/               # iOS configuration
    └── README.md          # Flutter app documentation
```

## Features Implemented

✅ PHP RESTful API with JSON responses
✅ Flutter app fetching data from API
✅ Clean ListView displaying items
✅ Loading indicator
✅ Error handling with retry functionality
✅ Pull-to-refresh support
✅ Modern, clean UI design
✅ Android and iOS support (no web)

## Next Steps

1. Start PHP API server
2. Configure API URL in Flutter app
3. Run Flutter app on emulator/device
4. Test the app functionality

## Notes

- The PHP API runs on port 8000 by default
- Flutter app is configured for Android and iOS only
- Both projects include comprehensive README files
- All code follows best practices and is well-documented

Good luck with your practical task submission! 🚀

