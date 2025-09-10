#!/bin/bash

# UK Energy Portal - Android App Build Script
# This script builds the Android APK that can be installed on any Android device

echo "🚀 Building UK Energy Portal Android App..."
echo "============================================"

# Check if required tools are available
check_requirements() {
    echo "📋 Checking requirements..."
    
    if ! command -v node &> /dev/null; then
        echo "❌ Node.js is not installed. Please install Node.js 18+ first."
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        echo "❌ npm is not installed. Please install npm first."
        exit 1
    fi
    
    echo "✅ Node.js and npm are available"
}

# Install dependencies
install_dependencies() {
    echo "📦 Installing dependencies..."
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install dependencies"
        exit 1
    fi
    echo "✅ Dependencies installed successfully"
}

# Build the web app
build_web_app() {
    echo "🔨 Building web application..."
    npm run build:mobile
    if [ $? -ne 0 ]; then
        echo "❌ Failed to build web application"
        exit 1
    fi
    echo "✅ Web application built successfully"
}

# Sync with Android
sync_android() {
    echo "🔄 Syncing with Android project..."
    npm run android:sync
    if [ $? -ne 0 ]; then
        echo "❌ Failed to sync Android project"
        exit 1
    fi
    echo "✅ Android project synced successfully"
}

# Build Android APK
build_android_apk() {
    echo "📱 Building Android APK..."
    
    # Navigate to android directory
    cd android
    
    # Make gradlew executable
    chmod +x gradlew
    
    # Build debug APK (unsigned - for testing)
    echo "Building debug APK..."
    ./gradlew assembleDebug
    
    if [ $? -eq 0 ]; then
        echo "✅ Debug APK built successfully!"
        echo "📍 Location: android/app/build/outputs/apk/debug/app-debug.apk"
        
        # Copy APK to root directory for easy access
        cp app/build/outputs/apk/debug/app-debug.apk ../uk-energy-portal-debug.apk
        echo "📋 APK copied to: uk-energy-portal-debug.apk"
    else
        echo "❌ Failed to build Android APK"
        cd ..
        exit 1
    fi
    
    cd ..
}

# Generate installation instructions
generate_instructions() {
    echo "📝 Generating installation instructions..."
    
    cat > ANDROID_INSTALL_INSTRUCTIONS.md << 'EOF'
# UK Energy Portal - Android Installation Guide

## 📱 Install on Android Device

### Method 1: Direct APK Installation (Recommended)

1. **Download the APK**
   - Copy `uk-energy-portal-debug.apk` to your Android device
   - You can transfer via USB, email, cloud storage, or direct download

2. **Enable Unknown Sources**
   - Go to Settings → Security (or Privacy)
   - Enable "Install from Unknown Sources" or "Allow from this source"
   - On newer Android versions: Settings → Apps → Special Access → Install Unknown Apps

3. **Install the App**
   - Locate the APK file on your device (usually in Downloads folder)
   - Tap the APK file
   - Follow the installation prompts
   - Tap "Install" when prompted

4. **Launch the App**
   - Find "UK Energy Portal" in your app drawer
   - Tap to launch the application

### Method 2: ADB Installation (For Developers)

```bash
# Connect your Android device via USB with USB Debugging enabled
adb install uk-energy-portal-debug.apk
```

## 🔧 Troubleshooting

### Installation Issues
- **"App not installed"**: Enable unknown sources and try again
- **"Parse error"**: Re-download the APK file, it may be corrupted
- **"Insufficient storage"**: Free up space on your device

### App Issues
- **App crashes on startup**: Clear app data in Settings → Apps → UK Energy Portal
- **Network issues**: Check your internet connection
- **Login problems**: Ensure you're using correct credentials

## 📋 App Features

✅ **Full Portal Functionality**
- Dashboard with energy usage charts
- Billing history and current bills
- Account management
- Support ticket system
- Payment processing
- Meter reading submission

✅ **Mobile Optimized**
- Responsive design for all screen sizes
- Touch-friendly interface
- Offline capability for cached content
- Native Android experience

✅ **Security**
- Secure HTTPS connections
- Local data encryption
- Biometric authentication support (if available)

## 🔄 Updates

To update the app:
1. Download the new APK version
2. Install over the existing app (data will be preserved)
3. Or uninstall the old version first for a clean install

## 📞 Support

If you encounter any issues:
- Check this troubleshooting guide first
- Contact IT support with device details and error messages
- Provide APK version and Android version information

---
**Version**: Debug Build
**Package**: com.ukenergyportal.app
**Minimum Android**: 7.0 (API 24)
**Target Android**: 14.0 (API 34)
EOF

    echo "✅ Installation instructions created: ANDROID_INSTALL_INSTRUCTIONS.md"
}

# Main execution
main() {
    echo "Starting build process..."
    
    check_requirements
    install_dependencies
    build_web_app
    sync_android
    build_android_apk
    generate_instructions
    
    echo ""
    echo "🎉 SUCCESS! Android app built successfully!"
    echo "============================================"
    echo "📱 APK File: uk-energy-portal-debug.apk"
    echo "📖 Instructions: ANDROID_INSTALL_INSTRUCTIONS.md"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Transfer the APK file to your Android device"
    echo "2. Follow the installation instructions"
    echo "3. Install and enjoy the UK Energy Portal app!"
    echo ""
    echo "🔧 For production builds, use Android Studio to:"
    echo "   - Generate signed APK/AAB"
    echo "   - Optimize for Google Play Store"
    echo "   - Add release configurations"
}

# Run the main function
main "$@"
