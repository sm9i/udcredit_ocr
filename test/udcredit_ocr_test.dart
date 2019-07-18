import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:udcredit_ocr/udcredit_ocr.dart';

void main() {
  const MethodChannel channel = MethodChannel('udcredit_ocr');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await UdcreditOcr.platformVersion, '42');
  });
}
