import Flutter
import UIKit

public class MojaAppAuthPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "moja_app_auth", binaryMessenger: registrar.messenger())
    let instance = MojaAppAuthPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isMojaAppInstalled":
      let url = URL(string: "moja://login")!
      result(UIApplication.shared.canOpenURL(url))
    case "loginWithMojaApp":
      if let url = URL(string: "moja://login") {
        UIApplication.shared.open(url)
        result("OTP/TOKEN placeholder from iOS")
      } else {
        result(nil)
      }
    case "redirectToStore":
      if let url = URL(string: "itms-apps://itunes.apple.com/app/com.sinon.app.moja_app") {
        UIApplication.shared.open(url)
      }
//       if let url = URL(string: "itms-apps://itunes.apple.com/app/idYOUR_APP_ID") {
//               UIApplication.shared.open(url)
//             }

      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
