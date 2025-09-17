// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.
import 'package:flutter/services.dart';
import 'moja_app_auth_platform_interface.dart';

class MojaAppAuth {
  static const MethodChannel _channel = MethodChannel('moja_app_auth');

  /// Check if MojaApp installed
  static Future<bool> isMojaAppInstalled() async {
    return await _channel.invokeMethod<bool>('isMojaAppInstalled') ?? false;
  }

  /// Login via MojaApp
  static Future<String?> loginWithMojaApp() async {
    return await _channel.invokeMethod<String>('loginWithMojaApp');
  }

  /// Redirect to Play Store / App Store
  static Future<void> redirectToStore() async {
    await _channel.invokeMethod('redirectToStore');
  }

  Future<String?> getPlatformVersion() {
    return MojaAppAuthPlatform.instance.getPlatformVersion();
  }
}
