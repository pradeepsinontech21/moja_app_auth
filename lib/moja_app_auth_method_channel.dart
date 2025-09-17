import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'moja_app_auth_platform_interface.dart';

/// An implementation of [MojaAppAuthPlatform] that uses method channels.
class MethodChannelMojaAppAuth extends MojaAppAuthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('moja_app_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
