import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gameanalytics_sdk/gameanalytics.dart';

void main() {
  const MethodChannel channel = MethodChannel('gameanalytics');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Gameanalytics.platformVersion, '42');
  });
}
