import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:udcredit_ocr/ocr_bean.dart';
import 'dart:convert';

class UdcreditOcr {
  static const MethodChannel _channel = const MethodChannel('udcredit_ocr');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<OcrBean> init({
    @required String outOrderId,
    @required String authKey,
    String urlNotify = "default",
  }) async {
    final String version = await _channel.invokeMethod('init', {
      "outOrderId": "$outOrderId",
      "authKey": "$authKey",
      "urlNotify": "$urlNotify"
    });
    Map<String, dynamic> res = json.decode(version);
    return OcrBean.fromJson(res);
  }
}
