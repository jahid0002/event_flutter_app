import FirebaseCore
import Flutter
import OneSignalFramework  // ✅ Add this import
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // ✅ Initialize Firebase (keep this so Google Sign-In keeps working)
    FirebaseApp.configure()

    // ✅ Initialize OneSignal
    OneSignal.Debug.setLogLevel(.LL_VERBOSE)  // optional: remove for release
    OneSignal.initialize("39e47de2-9435-4c22-b63c-b9ca67961e87", withLaunchOptions: launchOptions)
    OneSignal.Notifications.requestPermission(
      { accepted in
        print("User accepted notifications: \(accepted)")
      }, fallbackToSettings: true)

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
