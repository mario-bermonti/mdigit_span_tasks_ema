## Android

- Update the version number in `pubspec.yaml`
  Note: We update the part after `+` for internal testing
- Build app for release `flutter build appbundle --release`
- Test the release build
  - Install the app on a device `flutter install`
  - Test the app on the device by manually opening the app and testing all relevant functionality
- Upload App bundle to [Google Play Console](https://play.google.com/apps/publish/)
  - Select app
  - Select Internal testing
  - Select Create new release
  - Upload APK from project's `build/app/outputs/bundle/release/app-release.aab` (this may take a few minutes)
  - Add a `Release name` and `Release notes` and press `Next`
  - At this point, the console may identify new issues that you must resolve. Please contact the
    team if you need help with this or if the fixes could have an impact on the app's functionality
    or user experience. **You will probably need to upgrade the version number/code after these changes**.
  - Press `Next`
  - Add testers to the release
  - Send new link to testers
