import 'package:flutter_test/flutter_test.dart';
import 'package:moja_app_auth/moja_app_auth.dart';
import 'package:moja_app_auth/moja_app_auth_platform_interface.dart';
import 'package:moja_app_auth/moja_app_auth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMojaAppAuthPlatform
    with MockPlatformInterfaceMixin
    implements MojaAppAuthPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MojaAppAuthPlatform initialPlatform = MojaAppAuthPlatform.instance;

  test('$MethodChannelMojaAppAuth is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMojaAppAuth>());
  });

  test('getPlatformVersion', () async {
    MojaAppAuth mojaAppAuthPlugin = MojaAppAuth();
    MockMojaAppAuthPlatform fakePlatform = MockMojaAppAuthPlatform();
    MojaAppAuthPlatform.instance = fakePlatform;

    expect(await mojaAppAuthPlugin.getPlatformVersion(), '42');
  });
}
