import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class GAResourceFlowType {
  static const int Source = 1;
  static const int Sink = 2;
}

class GAProgressionStatus {
  static const int Start = 1;
  static const int Complete = 2;
  static const int Fail = 3;
}

class GAErrorSeverity {
  static const int Debug = 1;
  static const int Info = 2;
  static const int Warning = 3;
  static const int Error = 4;
  static const int Critical = 5;
}

class GAAdAction {
  static const int Clicked = 1;
  static const int Show = 2;
  static const int FailedShow = 3;
  static const int RewardReceived = 4;
  static const int Request = 5;
  static const int Loaded = 6;
}

class GAAdType {
  static const int Video = 1;
  static const int RewardedVideo = 2;
  static const int Playable = 3;
  static const int Interstitial = 4;
  static const int OfferWall = 5;
  static const int Banner = 6;
}

class GameAnalytics {
  static const MethodChannel _channel = const MethodChannel('gameanalytics');

  static Future<void> configureAvailableCustomDimensions01(
      List<String> customDimensions) async {
    await _channel.invokeMethod('configureAvailableCustomDimensions01',
        {'customDimensions': jsonEncode(customDimensions)});
  }

  static Future<void> configureAvailableCustomDimensions02(
      List<String> customDimensions) async {
    await _channel.invokeMethod('configureAvailableCustomDimensions02',
        {'customDimensions': jsonEncode(customDimensions)});
  }

  static Future<void> configureAvailableCustomDimensions03(
      List<String> customDimensions) async {
    await _channel.invokeMethod('configureAvailableCustomDimensions03',
        {'customDimensions': jsonEncode(customDimensions)});
  }

  static Future<void> configureAvailableResourceCurrencies(
      List<String> resourceCurrencies) async {
    await _channel.invokeMethod('configureAvailableResourceCurrencies',
        {'resourceCurrencies': jsonEncode(resourceCurrencies)});
  }

  static Future<void> configureAvailableResourceItemTypes(
      List<String> resourceItemTypes) async {
    await _channel.invokeMethod('configureAvailableResourceItemTypes',
        {'resourceItemTypes': jsonEncode(resourceItemTypes)});
  }

  static Future<void> configureBuild(String build) async {
    await _channel.invokeMethod('configureBuild', {'build': build});
  }

  static Future<void> configureAutoDetectAppVersion(bool flag) async {
    await _channel
        .invokeMethod('configureAutoDetectAppVersion', {'flag': flag});
  }

  static Future<void> configureUserId(String uId) async {
    await _channel.invokeMethod('configureUserId', {'uId': uId});
  }

  static Future<void> initialize(String gameKey, String secretKey) async {
    await _channel.invokeMethod(
        'initialize', {'gameKey': gameKey, 'secretKey': secretKey});
  }

  static Future<void> addBusinessEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addBusinessEvent', arguments);
  }

  static Future<void> addResourceEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addResourceEvent', arguments);
  }

  static Future<void> addProgressionEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addProgressionEvent', arguments);
  }

  static Future<void> addDesignEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addDesignEvent', arguments);
  }

  static Future<void> addErrorEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addErrorEvent', arguments);
  }

  static Future<void> addAdEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addAdEvent', arguments);
  }

  static Future<void> setEnabledInfoLog(bool flag) async {
    await _channel.invokeMethod('setEnabledInfoLog', {'flag': flag});
  }

  static Future<void> setEnabledVerboseLog(bool flag) async {
    await _channel.invokeMethod('setEnabledVerboseLog', {'flag': flag});
  }

  static Future<void> setEnabledManualSessionHandling(bool flag) async {
    await _channel
        .invokeMethod('setEnabledManualSessionHandling', {'flag': flag});
  }

  static Future<void> setEnabledEventSubmission(bool flag) async {
    await _channel.invokeMethod('setEnabledEventSubmission', {'flag': flag});
  }

  static Future<void> setCustomDimension01(String dimension) async {
    await _channel
        .invokeMethod('setCustomDimension01', {'dimension': dimension});
  }

  static Future<void> setCustomDimension02(String dimension) async {
    await _channel
        .invokeMethod('setCustomDimension02', {'dimension': dimension});
  }

  static Future<void> setCustomDimension03(String dimension) async {
    await _channel
        .invokeMethod('setCustomDimension03', {'dimension': dimension});
  }

  static Future<void> startSession() async {
    await _channel.invokeMethod('startSession');
  }

  static Future<void> endSession() async {
    await _channel.invokeMethod('endSession');
  }

  static Future<String?> getRemoteConfigsValueAsString(
      String key, String defaultValue) async {
    final String? result = await _channel.invokeMethod(
        'getRemoteConfigsValueAsString',
        {'key': key, 'defaultValue': defaultValue});
    return result;
  }

  static Future<bool> isRemoteConfigsReady() async {
    final bool result = await _channel.invokeMethod('isRemoteConfigsReady');
    return result;
  }

  static Future<String?> getRemoteConfigsContentAsString() async {
    final String? result =
        await _channel.invokeMethod('getRemoteConfigsContentAsString');
    return result;
  }

  static Future<String?> getABTestingId() async {
    final String? result = await _channel.invokeMethod('getABTestingId');
    return result;
  }

  static Future<String?> getABTestingVariantId() async {
    final String? result = await _channel.invokeMethod('getABTestingVariantId');
    return result;
  }
}
