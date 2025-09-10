@echo off
REM UK Energy Portal - Android App Build Script for Windows
REM This script builds the Android APK that can be installed on any Android device

echo 🚀 Building UK Energy Portal Android App...
echo ============================================

REM Check if Node.js is available
echo 📋 Checking requirements...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ first.
    pause
    exit /b 1
)

npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm first.
    pause
    exit /b 1
)

echo ✅ Node.js and npm are available

REM Install dependencies
echo 📦 Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)
echo ✅ Dependencies installed successfully

REM Build the web app
echo 🔨 Building web application...
call npm run build:mobile
if %errorlevel% neq 0 (
    echo ❌ Failed to build web application
    pause
    exit /b 1
)
echo ✅ Web application built successfully

REM Sync with Android
echo 🔄 Syncing with Android project...
call npm run android:sync
if %errorlevel% neq 0 (
    echo ❌ Failed to sync Android project
    pause
    exit /b 1
)
echo ✅ Android project synced successfully

REM Build Android APK
echo 📱 Building Android APK...
cd android

REM Build debug APK
echo Building debug APK...
call gradlew.bat assembleDebug

if %errorlevel% equ 0 (
    echo ✅ Debug APK built successfully!
    echo 📍 Location: android\app\build\outputs\apk\debug\app-debug.apk
    
    REM Copy APK to root directory for easy access
    copy app\build\outputs\apk\debug\app-debug.apk ..\uk-energy-portal-debug.apk
    echo 📋 APK copied to: uk-energy-portal-debug.apk
) else (
    echo ❌ Failed to build Android APK
    cd ..
    pause
    exit /b 1
)

cd ..

REM Generate installation instructions
echo 📝 Generating installation instructions...

echo # UK Energy Portal - Android Installation Guide > ANDROID_INSTALL_INSTRUCTIONS.md
echo. >> ANDROID_INSTALL_INSTRUCTIONS.md
echo ## 📱 Install on Android Device >> ANDROID_INSTALL_INSTRUCTIONS.md
echo. >> ANDROID_INSTALL_INSTRUCTIONS.md
echo ### Method 1: Direct APK Installation (Recommended) >> ANDROID_INSTALL_INSTRUCTIONS.md
echo. >> ANDROID_INSTALL_INSTRUCTIONS.md
echo 1. **Download the APK** >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Copy `uk-energy-portal-debug.apk` to your Android device >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - You can transfer via USB, email, cloud storage, or direct download >> ANDROID_INSTALL_INSTRUCTIONS.md
echo. >> ANDROID_INSTALL_INSTRUCTIONS.md
echo 2. **Enable Unknown Sources** >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Go to Settings → Security (or Privacy) >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Enable "Install from Unknown Sources" or "Allow from this source" >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - On newer Android versions: Settings → Apps → Special Access → Install Unknown Apps >> ANDROID_INSTALL_INSTRUCTIONS.md
echo. >> ANDROID_INSTALL_INSTRUCTIONS.md
echo 3. **Install the App** >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Locate the APK file on your device (usually in Downloads folder) >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Tap the APK file >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Follow the installation prompts >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Tap "Install" when prompted >> ANDROID_INSTALL_INSTRUCTIONS.md
echo. >> ANDROID_INSTALL_INSTRUCTIONS.md
echo 4. **Launch the App** >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Find "UK Energy Portal" in your app drawer >> ANDROID_INSTALL_INSTRUCTIONS.md
echo    - Tap to launch the application >> ANDROID_INSTALL_INSTRUCTIONS.md

echo ✅ Installation instructions created: ANDROID_INSTALL_INSTRUCTIONS.md

echo.
echo 🎉 SUCCESS! Android app built successfully!
echo ============================================
echo 📱 APK File: uk-energy-portal-debug.apk
echo 📖 Instructions: ANDROID_INSTALL_INSTRUCTIONS.md
echo.
echo 📋 Next Steps:
echo 1. Transfer the APK file to your Android device
echo 2. Follow the installation instructions
echo 3. Install and enjoy the UK Energy Portal app!
echo.
echo 🔧 For production builds, use Android Studio to:
echo    - Generate signed APK/AAB
echo    - Optimize for Google Play Store
echo    - Add release configurations
echo.
pause
