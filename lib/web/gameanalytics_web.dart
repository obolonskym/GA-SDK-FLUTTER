import 'dart:async';
import 'dart:html' as html show window;
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'gameanalytics_js.dart';

/// A web implementation of the Gameanalytics plugin.
class GameAnalyticsWeb {
  static final String VERSION = "1.0.6";

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'gameanalytics',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = GameAnalyticsWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
      case 'configureAvailableCustomDimensions01':
        final String customDimensions = call.arguments["customDimensions"];
        final List<String> list =
            List<String>.from(jsonDecode(customDimensions));
        GameAnalyticsJS.configureAvailableCustomDimensions01(list);
        break;
      case 'configureAvailableCustomDimensions02':
        final String customDimensions = call.arguments["customDimensions"];
        final List<String> list =
            List<String>.from(jsonDecode(customDimensions));
        GameAnalyticsJS.configureAvailableCustomDimensions02(list);
        break;
      case 'configureAvailableCustomDimensions03':
        final String customDimensions = call.arguments["customDimensions"];
        final List<String> list =
            List<String>.from(jsonDecode(customDimensions));
        GameAnalyticsJS.configureAvailableCustomDimensions03(list);
        break;
      case 'configureAvailableResourceCurrencies':
        final String resourceCurrencies = call.arguments["resourceCurrencies"];
        final List<String> list =
            List<String>.from(jsonDecode(resourceCurrencies));
        GameAnalyticsJS.configureAvailableResourceCurrencies(list);
        break;
      case 'configureAvailableResourceCurrencies':
        final String resourceCurrencies = call.arguments["resourceCurrencies"];
        final List<String> list =
            List<String>.from(jsonDecode(resourceCurrencies));
        GameAnalyticsJS.configureAvailableResourceCurrencies(list);
        break;
      case 'configureAvailableResourceItemTypes':
        final String resourceItemTypes = call.arguments["resourceItemTypes"];
        final List<String> list =
            List<String>.from(jsonDecode(resourceItemTypes));
        GameAnalyticsJS.configureAvailableResourceItemTypes(list);
        break;
      case 'configureBuild':
        final String build = call.arguments["build"];
        GameAnalyticsJS.configureBuild(build);
        break;
      case 'configureAutoDetectAppVersion':
        // Not support no web platform
        break;
      case 'configureUserId':
        final String uId = call.arguments["uId"];
        GameAnalyticsJS.configureUserId(uId);
        break;
      case 'initialize':
        final String gameKey = call.arguments["gameKey"];
        final String secretKey = call.arguments["secretKey"];
        GameAnalyticsJS.initialize(gameKey, secretKey);
        break;
      case 'addBusinessEvent':
        final String currency = call.arguments["currency"];
        final int amount = call.arguments["amount"];
        final String itemType = call.arguments["itemType"];
        final String itemId = call.arguments["itemId"];
        final String cartType = call.arguments["cartType"];
        GameAnalyticsJS.addBusinessEvent(
            currency, amount, itemType, itemId, cartType);
        break;
      case 'addResourceEvent':
        final int flowType = call.arguments["flowType"];
        final String currency = call.arguments["currency"];
        final double amount = call.arguments["amount"];
        final String itemType = call.arguments["itemType"];
        final String itemId = call.arguments["itemId"];
        GameAnalyticsJS.addResourceEvent(
            flowType, currency, amount, itemType, itemId);
        break;
      case 'addProgressionEvent':
        final int flowType = call.arguments["progressionStatus"];
        final String progression01 = call.arguments["progression01"];
        final String progression02 = call.arguments.containsKey("progression02")
            ? call.arguments["progression02"]
            : "";
        final String progression03 = call.arguments.containsKey("progression03")
            ? call.arguments["progression03"]
            : "";
        final double? score = call.arguments.containsKey("score")
            ? call.arguments["score"]
            : null;

        GameAnalyticsJS.addProgressionEvent(
            flowType, progression01, progression02, progression03, score);
        break;
      case 'addDesignEvent':
        final String eventId = call.arguments["eventId"];
        final double? value = call.arguments.containsKey("value")
            ? call.arguments["value"]
            : null;

        GameAnalyticsJS.addDesignEvent(eventId, value);
        break;
      case 'addErrorEvent':
        final int severity = call.arguments["severity"];
        final String message = call.arguments["message"];

        GameAnalyticsJS.addErrorEvent(severity, message);
        break;
      case 'addAdEvent':
        final int adAction = call.arguments["adAction"];
        final int adType = call.arguments["adType"];
        final String adSdkName = call.arguments["adSdkName"];
        final String adPlacement = call.arguments["adPlacement"];

        if (call.arguments.containsKey("noAdReason")) {
          final int noAdReason = call.arguments["noAdReason"];
          GameAnalyticsJS.addAdEventWithNoAdReason(
              adAction, adType, adSdkName, adPlacement, noAdReason);
        } else if (call.arguments.containsKey("duration")) {
          final int duration = call.arguments["duration"];
          GameAnalyticsJS.addAdEventWithDuration(
              adAction, adType, adSdkName, adPlacement, duration);
        } else {
          GameAnalyticsJS.addAdEvent(adAction, adType, adSdkName, adPlacement);
        }
        break;
      case 'setEnabledInfoLog':
        final bool flag = call.arguments["flag"];
        GameAnalyticsJS.setEnabledInfoLog(flag);
        break;
      case 'setEnabledVerboseLog':
        final bool flag = call.arguments["flag"];
        GameAnalyticsJS.setEnabledVerboseLog(flag);
        break;
      case 'setEnabledManualSessionHandling':
        final bool flag = call.arguments["flag"];
        GameAnalyticsJS.setEnabledManualSessionHandling(flag);
        break;
      case 'setEnabledEventSubmission':
        final bool flag = call.arguments["flag"];
        GameAnalyticsJS.setEnabledEventSubmission(flag);
        break;
      case 'setCustomDimension01':
        final String dimension = call.arguments["dimension"];
        GameAnalyticsJS.setCustomDimension01(dimension);
        break;
      case 'setCustomDimension02':
        final String dimension = call.arguments["dimension"];
        GameAnalyticsJS.setCustomDimension02(dimension);
        break;
      case 'setCustomDimension03':
        final String dimension = call.arguments["dimension"];
        GameAnalyticsJS.setCustomDimension03(dimension);
        break;
      case 'setCustomDimension03':
        final String dimension = call.arguments["dimension"];
        GameAnalyticsJS.setCustomDimension03(dimension);
        break;
      case 'startSession':
        GameAnalyticsJS.startSession();
        break;
      case 'endSession':
        GameAnalyticsJS.endSession();
        break;
      case 'getRemoteConfigsValueAsString':
        final String key = call.arguments["key"];
        final String? defaultValue = call.arguments.containsKey("defaultValue")
            ? call.arguments["defaultValue"]
            : null;
        return Future.value(
            GameAnalyticsJS.getRemoteConfigsValueAsString(key, defaultValue));
      case 'isRemoteConfigsReady':
        return Future.value(GameAnalyticsJS.isRemoteConfigsReady());
      case 'getRemoteConfigsContentAsString':
        return Future.value(GameAnalyticsJS.getRemoteConfigsContentAsString());
      case 'getABTestingId':
        return Future.value(GameAnalyticsJS.getABTestingId());
      case 'getABTestingVariantId':
        return Future.value(GameAnalyticsJS.getABTestingVariantId());
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              'gameanalytics for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  /// Returns a [String] containing the version of the platform.
  Future<String> getPlatformVersion() {
    final version = html.window.navigator.userAgent;
    return Future.value(version);
  }
}
