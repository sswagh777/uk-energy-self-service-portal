# UK Energy Portal - Android Application

## 📱 Overview

The UK Energy Portal Android app is a native mobile application built using Capacitor that wraps the Next.js web application into a fully functional Android app. This allows users to install and use the portal directly on their Android devices with a native app experience.

## 🚀 Quick Start

### For End Users (Installing the App)

1. **Download the APK**
   - Get the `uk-energy-portal-debug.apk` file
   - Transfer it to your Android device

2. **Install the App**
   - Enable "Install from Unknown Sources" in Android settings
   - Tap the APK file and follow installation prompts
   - Launch "UK Energy Portal" from your app drawer

### For Developers (Building the App)

#### Option 1: Automated Build (Recommended)
```bash
# Linux/Mac
./build-android-app.sh

# Windows
build-android-app.bat
```

#### Option 2: Manual Build
```bash
# Install dependencies
npm install

# Build web app
npm run build:mobile

# Sync with Android
npm run android:sync

# Build APK
cd android
./gradlew assembleDebug
```

## 📋 Requirements

### For Building
- Node.js 18+
- npm or yarn
- Java Development Kit (JDK) 11+
- Android SDK (automatically downloaded by Gradle)

### For Installing
- Android 7.0+ (API level 24+)
- ~50MB storage space
- Internet connection for full functionality

## 🏗️ Project Structure

```
├── android/                    # Native Android project
│   ├── app/
│   │   ├── src/main/
│   │   │   ├── AndroidManifest.xml
│   │   │   ├── assets/public/  # Web app files
│   │   │   └── res/           # Android resources
│   │   └── build.gradle
│   └── build.gradle
├── capacitor.config.ts         # Capacitor configuration
├── build-android-app.sh        # Build script (Linux/Mac)
├── build-android-app.bat       # Build script (Windows)
└── out/                       # Built web app (generated)
```

## 🔧 Configuration

### App Information
- **Package Name**: `com.ukenergyportal.app`
- **App Name**: UK Energy Portal
- **Version**: 1.0.0
- **Minimum Android**: 7.0 (API 24)
- **Target Android**: 14.0 (API 34)

### Permissions
The app requests the following permissions:
- `INTERNET` - For network access
- `ACCESS_NETWORK_STATE` - To check connectivity
- `ACCESS_WIFI_STATE` - For WiFi status
- `WRITE_EXTERNAL_STORAGE` - For file downloads
- `READ_EXTERNAL_STORAGE` - For file uploads
- `CAMERA` - For document scanning (optional)
- `VIBRATE` - For notifications

## 📱 Features

### ✅ Included Features
- **Full Portal Functionality**
  - Dashboard with energy usage charts
  - Billing history and current bills
  - Account management
  - Support ticket system
  - Payment processing (without monitoring tab)

- **Mobile Optimizations**
  - Responsive design for all screen sizes
  - Touch-friendly interface
  - Native Android navigation
  - Offline capability for cached content
  - Fast loading with static export

- **Native Integration**
  - App icon and splash screen
  - Android back button support
  - Status bar integration
  - File system access
  - Camera integration (for future features)

### 🔄 Future Enhancements
- Push notifications
- Biometric authentication
- Offline data synchronization
- Background sync
- Widget support
- Deep linking

## 🛠️ Development

### Building Different Variants

#### Debug Build (Development)
```bash
cd android
./gradlew assembleDebug
```
- Unsigned APK for testing
- Debug symbols included
- Faster build time

#### Release Build (Production)
```bash
cd android
./gradlew assembleRelease
```
- Requires signing configuration
- Optimized and minified
- Ready for distribution

### Signing Configuration

For production releases, add to `android/app/build.gradle`:

```gradle
android {
    signingConfigs {
        release {
            storeFile file('path/to/keystore.jks')
            storePassword 'store_password'
            keyAlias 'key_alias'
            keyPassword 'key_password'
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
}
```

### Customization

#### App Icon
Replace icons in `android/app/src/main/res/mipmap-*/`:
- `ic_launcher.png` - Standard icon
- `ic_launcher_round.png` - Round icon (Android 7.1+)

Use Android Asset Studio for proper sizing:
https://romannurik.github.io/AndroidAssetStudio/

#### App Name
Update in `android/app/src/main/res/values/strings.xml`:
```xml
<string name="app_name">UK Energy Portal</string>
```

#### Splash Screen
Customize in `android/app/src/main/res/values/styles.xml`

## 📦 Distribution

### Internal Distribution
1. **Direct APK Sharing**
   - Share the APK file directly
   - Users install via "Unknown Sources"

2. **Firebase App Distribution**
   - Upload APK to Firebase
   - Invite testers via email
   - Automatic update notifications

### Public Distribution
1. **Google Play Store**
   - Create signed AAB (Android App Bundle)
   - Upload to Google Play Console
   - Follow Google Play policies
   - Submit for review

2. **Alternative App Stores**
   - Amazon Appstore
   - Samsung Galaxy Store
   - F-Droid (for open source)

## 🐛 Troubleshooting

### Build Issues

#### Gradle Build Fails
```bash
# Clean and rebuild
cd android
./gradlew clean
./gradlew assembleDebug
```

#### Java/JDK Issues
- Ensure JDK 11+ is installed
- Set JAVA_HOME environment variable
- Use `java -version` to verify

#### Android SDK Issues
- Gradle will auto-download SDK
- Or install Android Studio for full SDK

### Installation Issues

#### "App not installed"
- Enable "Install from Unknown Sources"
- Check available storage space
- Try installing via ADB

#### "Parse error"
- Re-download APK (may be corrupted)
- Ensure APK is for correct architecture

### Runtime Issues

#### App crashes on startup
- Clear app data: Settings → Apps → UK Energy Portal → Storage → Clear Data
- Check Android version compatibility

#### Network connectivity issues
- Verify internet connection
- Check if corporate firewall blocks access
- Try different network (WiFi vs mobile data)

## 📊 Performance

### App Size
- APK Size: ~15-20MB
- Installed Size: ~40-50MB
- First Load: ~2-3 seconds
- Subsequent Loads: <1 second

### Optimization Tips
- Enable ProGuard for release builds
- Use WebP images for better compression
- Implement lazy loading for large datasets
- Cache frequently accessed data

## 🔒 Security

### Data Protection
- All network traffic uses HTTPS
- Local data stored in app sandbox
- No sensitive data in logs
- Secure token storage

### Best Practices
- Regular security updates
- Input validation
- Secure API endpoints
- Certificate pinning (for production)

## 📞 Support

### For Users
- Check troubleshooting section first
- Contact IT support with:
  - Device model and Android version
  - APK version
  - Error messages or screenshots
  - Steps to reproduce issue

### For Developers
- Capacitor Documentation: https://capacitorjs.com/docs
- Android Developer Guide: https://developer.android.com
- Next.js Static Export: https://nextjs.org/docs/app/building-your-application/deploying/static-exports

## 📝 License

This project is proprietary software. All rights reserved.

## 🤝 Contributing

For internal development:
1. Fork the repository
2. Create feature branch
3. Test on multiple Android devices
4. Submit pull request with detailed description

---

**Last Updated**: December 2024
**Version**: 1.0.0
**Maintainer**: Development Team
