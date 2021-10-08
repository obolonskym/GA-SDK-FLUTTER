import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

/// This enum is used to specify flow in resource events
class GAResourceFlowType {
  static const int Source = 1;
  static const int Sink = 2;
}

/// This enum is used to specify status for progression event
class GAProgressionStatus {
  static const int Start = 1;
  static const int Complete = 2;
  static const int Fail = 3;
}

/// This enum is used to specify severity of an error event
class GAErrorSeverity {
  static const int Debug = 1;
  static const int Info = 2;
  static const int Warning = 3;
  static const int Error = 4;
  static const int Critical = 5;
}

/// This enum is used to specify action of an ad event
class GAAdAction {
  static const int Clicked = 1;
  static const int Show = 2;
  static const int FailedShow = 3;
  static const int RewardReceived = 4;
  static const int Request = 5;
  static const int Loaded = 6;
}

/// This enum is used to specify type of an ad event
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

  /// Set available 1st custom dimensions
  static Future<void> configureAvailableCustomDimensions01(
      List<String> customDimensions) async {
    await _channel.invokeMethod('configureAvailableCustomDimensions01',
        {'customDimensions': jsonEncode(customDimensions)});
  }

  /// Set available 2nd custom dimensions
  static Future<void> configureAvailableCustomDimensions02(
      List<String> customDimensions) async {
    await _channel.invokeMethod('configureAvailableCustomDimensions02',
        {'customDimensions': jsonEncode(customDimensions)});
  }

  /// Set available 3rd custom dimensions
  static Future<void> configureAvailableCustomDimensions03(
      List<String> customDimensions) async {
    await _channel.invokeMethod('configureAvailableCustomDimensions03',
        {'customDimensions': jsonEncode(customDimensions)});
  }

  /// Set available resource currencies
  static Future<void> configureAvailableResourceCurrencies(
      List<String> resourceCurrencies) async {
    await _channel.invokeMethod('configureAvailableResourceCurrencies',
        {'resourceCurrencies': jsonEncode(resourceCurrencies)});
  }

  /// Set available resource item types
  static Future<void> configureAvailableResourceItemTypes(
      List<String> resourceItemTypes) async {
    await _channel.invokeMethod('configureAvailableResourceItemTypes',
        {'resourceItemTypes': jsonEncode(resourceItemTypes)});
  }

  /// Set app build version
  static Future<void> configureBuild(String build) async {
    await _channel.invokeMethod('configureBuild', {'build': build});
  }

  /// Enable auto detect of app version to use for build field
  /// (iOS and Android only)
  static Future<void> configureAutoDetectAppVersion(bool flag) async {
    await _channel
        .invokeMethod('configureAutoDetectAppVersion', {'flag': flag});
  }

  /// Set a custom unique user_id identifying the user.
  static Future<void> configureUserId(String uId) async {
    await _channel.invokeMethod('configureUserId', {'uId': uId});
  }

  /// Initialize GameAnalytics SDK
  static Future<void> initialize(String gameKey, String secretKey) async {
    await _channel.invokeMethod(
        'initialize', {'gameKey': gameKey, 'secretKey': secretKey});
  }

  /// Add new business event
  ///
  /// Usage:
  /// GameAnalytics.addBusinessEvent({
  ///   "currency": "USD",
  ///   "amount": 99,
  ///   "itemType": "weapons",
  ///   "itemId": "shotgun",
  ///   "cartType": "end_of_level"
  /// });
  ///
  /// GameAnalytics.addBusinessEvent({
  ///   "currency": "USD",
  ///   "amount": 99,
  ///   "itemType": "weapons",
  ///   "itemId": "shotgun",
  ///   "cartType": "end_of_level",
  ///   "receipt": "test_receipt",
  ///   "signature": "test_signature"
  /// });
  ///
  /// GameAnalytics.addBusinessEvent({
  ///   "currency": "USD",
  ///   "amount": 99,
  ///   "itemType": "weapons",
  ///   "itemId": "shotgun",
  ///   "cartType": "end_of_level",
  ///   "customFields": [fields_in_json_string]
  /// });
  static Future<void> addBusinessEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addBusinessEvent', arguments);
  }

  /// Add new resource event
  ///
  /// Usage:
  /// GameAnalytics.addResourceEvent({
  ///   "flowType": GAResourceFlowType.Source,
  ///   "currency": "gems",
  ///   "amount": 100,
  ///   "itemType": "lives",
  ///   "itemId": "5lives"
  /// });
  ///
  /// GameAnalytics.addResourceEvent({
  ///   "flowType": GAResourceFlowType.Source,
  ///   "currency": "gems",
  ///   "amount": 100,
  ///   "itemType": "lives",
  ///   "itemId": "5lives",
  ///   "customFields": [fields_in_json_string]
  /// });
  static Future<void> addResourceEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addResourceEvent', arguments);
  }

  /// Add new progression event
  ///
  /// Usage:
  /// GameAnalytics.addProgressionEvent({
  ///   "progressionStatus": GAProgressionStatus.Start,
  ///   "progression01": "world01",
  ///   "progression02": "level01",
  ///   "progression03": "phase01",
  ///   "itemId": "5lives"
  /// });
  ///
  /// GameAnalytics.addProgressionEvent({
  ///   "progressionStatus": GAProgressionStatus.Complete,
  ///   "progression01": "world01",
  ///   "progression02": "level01",
  ///   "progression03": "phase01",
  ///   "score": 666
  /// });
  ///
  /// GameAnalytics.addProgressionEvent({
  ///   "progressionStatus": GAProgressionStatus.Complete,
  ///   "progression01": "world01",
  ///   "progression02": "level01",
  ///   "progression03": "phase01",
  ///   "score": 666,
  ///   "customFields": [fields_in_json_string]
  /// });
  static Future<void> addProgressionEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addProgressionEvent', arguments);
  }

  /// Add new design event
  ///
  /// Usage:
  /// GameAnalytics.addDesignEvent({"eventId": "some:event"});
  ///
  /// GameAnalytics.addDesignEvent({
  ///   "eventId": "some:other:event",
  ///   "value": 666
  /// });
  ///
  /// GameAnalytics.addDesignEvent({
  ///   "eventId": "some:other:event",
  ///   "value": 666,
  ///   "customFields": [fields_in_json_string]
  /// });
  static Future<void> addDesignEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addDesignEvent', arguments);
  }

  /// Add new error event
  ///
  /// Usage:
  /// GameAnalytics.addErrorEvent({
  ///   "severity": GAErrorSeverity.Error,
  ///   "message": "This is an error message!!!"
  /// });
  ///
  /// GameAnalytics.addErrorEvent({
  ///   "severity": GAErrorSeverity.Error,
  ///   "message": "This is an error message!!!",
  ///   "customFields": [fields_in_json_string]
  /// });
  static Future<void> addErrorEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addErrorEvent', arguments);
  }

  /// Add new ad event
  ///
  /// Usage:
  /// GameAnalytics.addAdEvent({
  ///   "adAction": GAAdAction.Show,
  ///   "adType": GAAdType.Interstitial,
  ///   "adSdkName": "mopub",
  ///   "adPlacement": "end_of_level"
  /// });
  ///
  /// GameAnalytics.addAdEvent({
  ///   "adAction": GAAdAction.Show,
  ///   "adType": GAAdType.Interstitial,
  ///   "adSdkName": "mopub",
  ///   "adPlacement": "end_of_level",
  ///   "customFields": [fields_in_json_string]
  /// });
  static Future<void> addAdEvent([dynamic arguments]) async {
    await _channel.invokeMethod('addAdEvent', arguments);
  }

  /// Enable info logging to console
  static Future<void> setEnabledInfoLog(bool flag) async {
    await _channel.invokeMethod('setEnabledInfoLog', {'flag': flag});
  }

  /// Enable verbose info logging of analytics. Will output event JSON data to console.
  static Future<void> setEnabledVerboseLog(bool flag) async {
    await _channel.invokeMethod('setEnabledVerboseLog', {'flag': flag});
  }

  /// Enable manual session handling.
  static Future<void> setEnabledManualSessionHandling(bool flag) async {
    await _channel
        .invokeMethod('setEnabledManualSessionHandling', {'flag': flag});
  }

  /// Enable/disable event submission.
  static Future<void> setEnabledEventSubmission(bool flag) async {
    await _channel.invokeMethod('setEnabledEventSubmission', {'flag': flag});
  }

  /// Set 1st custom dimension
  static Future<void> setCustomDimension01(String dimension) async {
    await _channel
        .invokeMethod('setCustomDimension01', {'dimension': dimension});
  }

  /// Set 2nd custom dimension
  static Future<void> setCustomDimension02(String dimension) async {
    await _channel
        .invokeMethod('setCustomDimension02', {'dimension': dimension});
  }

  /// Set 3rd custom dimension
  static Future<void> setCustomDimension03(String dimension) async {
    await _channel
        .invokeMethod('setCustomDimension03', {'dimension': dimension});
  }

  /// Start a new session.
  static Future<void> startSession() async {
    await _channel.invokeMethod('startSession');
  }

  /// End an active session.
  static Future<void> endSession() async {
    await _channel.invokeMethod('endSession');
  }

  /// Get remote configs value as string
  static Future<String?> getRemoteConfigsValueAsString(
      String key, String defaultValue) async {
    final String? result = await _channel.invokeMethod(
        'getRemoteConfigsValueAsString',
        {'key': key, 'defaultValue': defaultValue});
    return result;
  }

  /// Call for checking if remote configs values are loaded and ready
  static Future<bool> isRemoteConfigsReady() async {
    final bool result = await _channel.invokeMethod('isRemoteConfigsReady');
    return result;
  }

  /// Get remote configs configurations
  static Future<String?> getRemoteConfigsContentAsString() async {
    final String? result =
        await _channel.invokeMethod('getRemoteConfigsContentAsString');
    return result;
  }

  /// Get A/B testing id
  static Future<String?> getABTestingId() async {
    final String? result = await _channel.invokeMethod('getABTestingId');
    return result;
  }

  /// Get A/B testing variant id
  static Future<String?> getABTestingVariantId() async {
    final String? result = await _channel.invokeMethod('getABTestingVariantId');
    return result;
  }
}
