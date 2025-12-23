# Practical Task Assignment - PHP API & Flutter App

This project contains two applications:
1. **PHP RESTful API** - A simple API that returns JSON data
2. **Flutter Mobile App** - An Android/iOS app that fetches and displays data from the PHP API

## 📁 Project Structure

```
Tital group practical task/
├── php-api/              # PHP RESTful API
│   ├── index.php        # Main API endpoint handler
│   ├── .htaccess        # Apache configuration
│   └── README.md        # PHP API documentation
│
├── flutter-app/         # Flutter mobile application
│   ├── lib/            # Source code
│   ├── android/        # Android configuration
│   ├── ios/            # iOS configuration
│   └── README.md       # Flutter app documentation
│
└── SETUP_GUIDE.md      # Complete setup instructions
```

## 🚀 Quick Start

### 1. Start PHP API

```bash
cd php-api
php -S localhost:8000
```

Test it: Open `http://localhost:8000/api/items` in your browser

### 2. Setup Flutter App

```bash
cd flutter-app
flutter pub get
```

### 3. Configure API URL

Edit `flutter-app/lib/app/constants/api_constants.dart`:
- **iOS Simulator**: `http://localhost:8000`
- **Android Emulator**: `http://10.0.2.2:8000`
- **Physical Device**: `http://YOUR_IP_ADDRESS:8000`

### 4. Run Flutter App

```bash
flutter run
```

## ✅ Requirements Checklist

### PHP API ✅
- [x] RESTful API endpoint
- [x] Returns JSON data
- [x] CORS enabled
- [x] Accessible locally
- [x] Sample data (items/products)

### Flutter App ✅
- [x] Fetches data from PHP API
- [x] Displays data in ListView
- [x] Loading indicator
- [x] Error handling
- [x] Retry functionality
- [x] Clean, readable UI
- [x] Android support
- [x] iOS support
- [x] Pull-to-refresh

## 📱 Features

### PHP API Endpoints
- `GET /api/items` - Get all items
- `GET /api/items/{id}` - Get single item
- `GET /api/health` - Health check

### Flutter App Features
- Beautiful card-based UI
- Loading states
- Error handling with retry
- Pull-to-refresh
- Stock status indicators
- Rating display
- Price formatting

## 📚 Documentation

- **PHP API**: See `php-api/README.md`
- **Flutter App**: See `flutter-app/README.md`
- **Setup Guide**: See `SETUP_GUIDE.md`

## 🛠️ Technologies Used

### PHP API
- PHP 7.0+
- JSON responses
- RESTful architecture

### Flutter App
- Flutter SDK 3.0+
- GetX (State management)
- HTTP package (API calls)
- Material Design 3

## 📝 Notes

- The PHP API uses the built-in PHP server for simplicity
- Flutter app is configured for Android and iOS only (no web)
- Both projects include comprehensive documentation
- All code follows best practices

## 🐛 Troubleshooting

See `SETUP_GUIDE.md` for detailed troubleshooting steps.

Common issues:
- **API connection**: Check API URL and ensure PHP server is running
- **Network errors**: Verify device/emulator can access the API URL
- **Dependencies**: Run `flutter pub get` if packages are missing

---

**Created for Practical Task Assignment Submission**

