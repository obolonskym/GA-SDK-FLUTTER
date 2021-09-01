@JS()
library GameAnalytics.js;

import 'package:js/js.dart';

@JS("gameanalytics.GameAnalytics")
class GameAnalyticsJS {

    external static void configureAvailableCustomDimensions01(List<String> customDimensions);
    external static void configureAvailableCustomDimensions02(List<String> customDimensions);
    external static void configureAvailableCustomDimensions03(List<String> customDimensions);
    external static void configureAvailableResourceCurrencies(List<String> resourceCurrencies);
    external static void configureAvailableResourceItemTypes(List<String> resourceItemTypes);
    external static void configureBuild(String build);
    external static void configureUserId(String uId);
    external static void configureSdkGameEngineVersion(String sdkGameEngineVersion);
    external static void initialize(String gameKey, String secretKey);
    external static void addBusinessEvent(String currency, int amount, String itemType, String itemId, String cartType);
    external static void addResourceEvent(int flowType, String currency, double amount, String itemType, String itemId);
    external static void addProgressionEvent(int addProgressionEvent, String progression01, String progression02, String progression03, double? score);
    external static void addDesignEvent(String eventId, double? value);
    external static void addErrorEvent(int severity, String message);
    external static void addAdEventWithNoAdReason(int adAction, int adType, String adSdkName, String adPlacement, int noAdReason);
    external static void addAdEventWithDuration(int adAction, int adType, String adSdkName, String adPlacement, int duration);
    external static void addAdEvent(int adAction, int adType, String adSdkName, String adPlacement);
    external static void setEnabledInfoLog(bool flag);
    external static void setEnabledVerboseLog(bool flag);
    external static void setEnabledManualSessionHandling(bool flag);
    external static void setEnabledEventSubmission(bool flag);
    external static void setCustomDimension01(String dimension);
    external static void setCustomDimension02(String dimension);
    external static void setCustomDimension03(String dimension);
    external static void startSession();
    external static void endSession();
    external static String getRemoteConfigsValueAsString(String key, String? defaultValue);
    external static bool isRemoteConfigsReady();
    external static String getRemoteConfigsContentAsString();
    external static String getABTestingId();
    external static String getABTestingVariantId();
}
