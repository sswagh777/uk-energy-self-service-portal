# How to Download the UK Energy Portal Android Project

## 📥 Download Methods

Since you're working in a web-based environment, here are several ways to download the complete project to your local machine:

### Method 1: Download as ZIP (Recommended)

1. **Look for Download Options in Your Environment**
   - Check if there's a "Download" or "Export" button in your current interface
   - Look for file menu options like "Download Project" or "Export Files"
   - Some environments have a download icon in the toolbar

2. **Alternative: Use Browser Download**
   - Right-click in the file explorer area
   - Look for "Download" or "Save As" options
   - Select "Download All Files" or "Download Project"

### Method 2: Git Clone (If Available)

If this is a Git repository, you can clone it:

```bash
# If you have the repository URL
git clone [repository-url]
cd uk-energy-portal
```

### Method 3: Individual File Download

If bulk download isn't available, you can download key files individually:

#### Essential Files for Android App:
1. **Complete Project Structure**
   - Download the entire `android/` folder
   - Download `capacitor.config.ts`
   - Download `package.json`
   - Download `next.config.ts`

2. **Source Code**
   - Download the entire `src/` folder
   - Download `public/` folder if it exists

3. **Build Scripts**
   - `build-android-app.sh`
   - `build-android-app.bat`

4. **Documentation**
   - `README_ANDROID_APP.md`
   - `ANDROID_BUILD_INSTRUCTIONS.md`
   - `ANDROID_APP_SUMMARY.md`

### Method 4: Copy-Paste Method

If download options are limited:

1. **Create Local Project Folder**
   ```bash
   mkdir uk-energy-portal-android
   cd uk-energy-portal-android
   ```

2. **Recreate Key Files**
   - Copy the content from each important file
   - Paste into new files on your local machine
   - Maintain the same folder structure

## 🚀 After Download - Quick Setup

Once you have the project on your local machine:

### 1. Install Prerequisites
```bash
# Install Node.js 18+ from https://nodejs.org
# Install Android Studio from https://developer.android.com/studio
```

### 2. Setup Project
```bash
# Navigate to project folder
cd uk-energy-portal-android

# Install dependencies
npm install

# Build the web app
npm run build:mobile

# Sync with Android
npm run android:sync
```

### 3. Build Android APK
```bash
# Option A: Use automated script
./build-android-app.sh    # Linux/Mac
# OR
build-android-app.bat     # Windows

# Option B: Use Android Studio
npm run android:open
# Then use Build → Generate Signed Bundle/APK
```

## 📱 Alternative: Manual Recreation

If downloading is not possible, you can recreate the project manually:

### 1. Create New Next.js Project
```bash
npx create-next-app@latest uk-energy-portal --typescript --tailwind --eslint
cd uk-energy-portal
```

### 2. Install Capacitor
```bash
npm install @capacitor/core @capacitor/cli @capacitor/android
npx cap init "UK Energy Portal" "com.ukenergyportal.app"
```

### 3. Copy Source Code
- Copy all the React components from the `src/` folder
- Copy the configuration files
- Copy the build scripts

### 4. Configure for Mobile
- Update `next.config.ts` with static export settings
- Update `capacitor.config.ts` with proper configuration
- Add Android platform: `npx cap add android`

## 🔧 Troubleshooting Download Issues

### If Download Buttons Are Missing:
1. **Check Browser Settings**
   - Ensure downloads are enabled
   - Check if popup blockers are interfering

2. **Try Different Browser**
   - Some environments work better with Chrome/Firefox
   - Clear browser cache and try again

3. **Contact Support**
   - If you're in a corporate environment, contact IT support
   - Ask about file download permissions or restrictions

### If Files Are Corrupted:
1. **Re-download Individual Files**
   - Download files one by one
   - Verify file sizes match expectations

2. **Check File Integrity**
   - Ensure text files open properly
   - Verify JSON files have valid syntax

## 📞 Need Help?

If you're having trouble downloading:

1. **Check Your Current Environment**
   - Look for download/export options in menus
   - Check if there's a "Files" or "Explorer" panel with download options

2. **Environment-Specific Instructions**
   - **CodeSandbox**: Use the download button in the top menu
   - **Replit**: Use the download option in the file menu
   - **GitHub Codespaces**: Use the Command Palette (Ctrl+Shift+P) → "Download"
   - **VS Code Online**: Look for download options in the file explorer

3. **Alternative Solutions**
   - If you can't download, I can help you recreate the project step by step
   - We can focus on the most critical files first
   - I can provide detailed instructions for manual setup

## ✅ Verification After Download

Once downloaded, verify you have:
- ✅ `android/` folder with Android Studio project
- ✅ `src/` folder with React components
- ✅ `package.json` with all dependencies
- ✅ `capacitor.config.ts` configuration
- ✅ Build scripts (`build-android-app.sh` and `.bat`)
- ✅ Documentation files

**Ready to build your Android app!** 🚀📱
