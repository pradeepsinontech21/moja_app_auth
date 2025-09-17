import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'moja_app_auth_method_channel.dart';

abstract class MojaAppAuthPlatform extends PlatformInterface {
  /// Constructs a MojaAppAuthPlatform.
  MojaAppAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static MojaAppAuthPlatform _instance = MethodChannelMojaAppAuth();

  /// The default instance of [MojaAppAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelMojaAppAuth].
  static MojaAppAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MojaAppAuthPlatform] when
  /// they register themselves.
  static set instance(MojaAppAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
