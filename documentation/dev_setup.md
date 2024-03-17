# Guide for Developers

Included below is the guide to setup flutter and dart on your system.\
Please download the latest version of each software being used from the links provided below.

## Windows Setup

### Download
1. [Flutter](https://docs.flutter.dev/get-started/install)
2. [JDK 17 x64](https://adoptium.net/temurin/releases/){ Select your computer architecture } (Download and install this)
3. [Gradle](https://gradle.org/releases/)
4. [Android Studio](https://developer.android.com/studio) (Download the installer but *do not install* this yet)
5. Code editor of your choice ([VSCode](https://code.visualstudio.com/download) or continue using Android Studio)

### Flutter Installation

#### Location and Unzipping
Choose a location that does not require admin access and does not have spaces. Example: `D:\dev\`.

Extract the flutter zip file to the location and rename it to "flutter"

#### Update Path

1. Open **Edit the system environment variables** from start menu.
2. Under **User Variables** click *Path* and then click *Edit*.
3. Hit **browse..** and select the **bin** folder inside the flutter folder. Example: `D:\dev\flutter\bin`
4. Save and restart any open terminal window or code editor.

#### Confirm Flutter Installation
1. Check location (if you get an error restart)
    - Command Prompt: `where flutter dart`
    - Powershell: `where.exe flutter dart`
   ##### Example Output:
    ```
    D:\dev\flutter\bin\flutter
    D:\dev\flutter\bin\flutter.bat
    D:\dev\flutter\bin\dart
    D:\dev\flutter\bin\dart.bat
    ```
2. Run `flutter doctor` in command prompt or powershell. Do not worry about any `[X]` or `[!]` for now.
   ##### Example Output:
    ```powershell
    PS D:\dev\flutter> flutter doctor
    Doctor summary (to see all details, run flutter doctor -v):
    [√] Flutter (Channel stable, x.y.z, on Microsoft Windows [Version a.b.c.d], locale en-US)
    [X] Android toolchain - develop for Android devices
        X Unable to locate Android SDK.
        Install Android Studio from: https://developer.android.com/studio/index.html
        On first launch it will assist you in installing the Android SDK components.
        (or visit https://flutter.dev/docs/get-started/install/windows#android-setup for detailed instructions).
        If the Android SDK has been installed to a custom location, please use
        `flutter config --android-sdk` to update to that location.

    [√] Chrome - develop for the web
    [!] Android Studio (not installed)
    [√] VS Code (version x.y.z)
    ```
   You might get lesser or more number of `[X]` or `[!]` right now. Do not worry about them.
### JDK Installation
1. Run the downloaded JDK installer.
2. Follow the instructions and install JDK to the default location, make sure to enable the option of adding `JAVA_HOME` to path.
3. Save and restart any open terminal window or code editor.

   #### Forgot to add `JAVA_HOME` to path?
    1. Open **Edit the system environment variables** from start menu.
    2. Under **System Variables** click *New*.
    3. Enter `JAVA_HOME` as variable name and the path to JDK as variable value. Example: `C:\Program Files\Eclipse Adoptium\jdk-17.0.7.7-hotspot`.
    4. Click *Ok*.
    5. Save and restart any open terminal window or code editor.

### Gradle Installation
1. Extract the gradle zip file to the location(`D:\dev\`) and rename it to "gradle-7.0".
2. Update Path
    1. Open **Edit the system environment variables** from start menu.
    2. Under **System Variables** click *New*.
    3. Enter `GRADLE_HOME` as variable name and the path to gradle as variable value. Example: `D:\dev\gradle-7.0`.
    4. Click *Ok*.
    5. Save and restart any open terminal window or code editor.

### Android Studio Configuration
#### Installing Android Studio and Setting up location
1. Run the **Android Studio** installer.
2. Follow the instructions and install Android Studio to the default location.
3. Skip the step of installing Android SDK, etc. We will do it manually.
4. Finish downloading and installing Android Studio, close Android Studio.
5. Create a new folder named *android-sdk* in the parent location(`D:\dev\`).Example: `D:\dev\android-sdk`.
6. Open Android Studio and click **More Actions**, and then click **SDK Manager**.
7. The second line of the window will show the location of Android SDK. Click the **Edit** button on the right.
8. In the *SDK Components Setup* page, click **browse icon** in *Android SDK Location* and select your newly created folder(`D:\dev\android-sdk`).
9. Keep clicking **Next** until you reach the *SDK Platforms* page again.

#### Installing Android SDK
1. In the **SDK Platforms** page, select:
    - Android API 34
    - Android 13.0 -> 33
    - Android 12L -> 32
    - Android 12.0 -> 31
    - Android 11.0 -> 30
    - Android 10.0 -> 29
2. In the **SDK Tools* page, select:
    - Android SDK Build-Tools 34
    - Android SDK Command-line Tools(latest)
    - CMake
    - Android emulator
    - Android SDK Platform-Tools
    - All Google Play services, and the USB and Web Driver
3. Hit **Ok** and then **Confirm Change**.
4. Wait for the download to finish, and then hit **finish** and close Android Studio.

#### Updating Path
1. Open **Edit the system environment variables** from start menu.
2. Set `ANDROID_HOME`:
    1. Under **System Variable** click *New*.
    2. Variable name: `ANDROID_HOME`, Variable value: Path to your android sdk(  `D:\dev\android-sdk` ).
3. Set `ANDROID_SDK_ROOT`:
    1. Under **System Variable** click *New*.
    2. Variable name: `ANDROID_SDK_ROOT`, Variable value: Path to your android sdk(  `D:\dev\android-sdk` ).
4. Under **System Variables** click *Path*, then click *Edit* and then add all of below these by *New*.
    - `%ANDROID_SDK_ROOT%\cmdline-tools\tools\bin`
    - `%ANDROID_HOME%\emulator`
    - `%ANDROID_HOME%\tools`
    - `%ANDROID_HOME%\platform-tools`

### Android Virtual Device

Try Android Studio, if it doesn't work try the terminal option.

#### From Android Studio
1. Open Android Studio and click **More Actions**, and then click **AVD Manager**.
2. Click **Create Device**.
3. Select the device you want to emulate and click **Next**.
4. Download the system image for the device you selected and click **Next**. {Its greater than a gig D: }
5. Select the downloaded system image and click **Next**.
6. Give a good name to the device and click **Finish**.
7. Close Android Studio and restart any open terminal window or code editor.

#### From Command Line
1. Navigate to `%ANDROID_SDK_ROOT%\cmdline-tools\tools\bin` folder, right click and select **Open in Terminal**.
2. In the terminal, run `.\avdmanager list`. Find the device you want to emulate from the list and keep track of **id**. Example:
    ```
    id: 30 or "pixel 7 pro"
        Name: Pixel 7 Pro
        OEM : Google
    ```
3. Think of a good name for the device. Example: `pixel-7-pro`.
4. In terminal:
   `avdmanager create avd -n {name} -k "{image}" -d {id}`
   Example: `avdmanager create avd -n pixel-7-pro -k "system-images;android-33;google_apis;x86_64" -d 30`

#### Testing the Emulator
1. List the available emulators: `emulator -list-avds`.
2. To run an emulator: `emulator -avd {name}`. Example: `emulator -avd pixel-7-pro`.
3. This should launch the emulator.

### Final Flutter Check
1. Accept all licenses by running `flutter doctor --android-licenses` and keep hitting `Y`.
2. Run `flutter doctor -v` in terminal. If you get any errors about **Visual Studio** or **Chrome Executable** do not worry.

## Linux Setup

[RTFM](https://docs.flutter.dev/get-started/install/linux)

## Code Editor Setup

### VS Code Configuration
1. Install VSCode.
2. Open **Extensions** Tab or **Ctrl + Shift + X**, and search and install the following extensions:
    - Dart
    - Flutter
    - Pubspec Assist
    - Flutter Tree
    - Bracket Pair Color DLW
    - Better Comments
    - Color Highlight
3. After installation reload VSCode by **Ctrl + Shift + P** and type **Reload Window** and hit enter.

### Android Studio Configuration
1. Open Android Studio and click **More Actions**, and then click **Plugins**.
2. Search and install the following plugins:
    - Dart
    - Flutter
    - Flutter Enhancement Suite
    - Flutter Snippets
    - Better Comments


### Confirming Setup
1. Launch emulator by running `emulator -avd {name}` in terminal.
2. In a seperate terminal, navigate to a folder where you want to create the project. Example: `cd D:\dev\test\`. *We will be deleteing this later*
3. Run `flutter create {name}`. Example: `flutter create test`.
    - This creates a flutter project with the name you provided.
    - It is an example project with a counter app.
4. Run `cd {name}`. Example: `cd test`.
5. Run `flutter run`. This should launch the app in the emulator.

### Running the App

#### CLI
1. Open Project Folder in terminal by hitting `~` in VSCode.
2. Launch emulator command as done previously: `emulator -avd {name}`
3. Open another terminal in VSCode from the **Terminal** tab.
4. Launch app in new terminal using the command: `flutter run`
5. For hot reload, in the emulator terminal enter `r`.

#### VSCode GUI
1. Open the project folder in VSCode.
2. Open Command Palate by **Ctrl + Shift + P** and type **Flutter: Launch Emulator**.
3. Open Command Palate by **Ctrl + Shift + P** and type **Flutter: Run Flutter on Android**.
4. For hot reload, **Save All** or press the hot reload button.

#### Android Studio GUI
1. Open the project folder in Android Studio.
2. Click **Run** and then **Run 'main.dart'**.
3. For hot reload, **Save All** or press the hot reload button.
