#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint gameanalytics.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'gameanalytics_sdk'
  s.version          = '1.2.2'
  s.summary          = 'Official Flutter SDK for GameAnalytics. GameAnalytics is a free analytics platform that helps game developers understand their players behaviour by delivering relevant insights.'
  s.description      = 'Official Flutter SDK for GameAnalytics. GameAnalytics is a free analytics platform that helps game developers understand their players behaviour by delivering relevant insights.'
  s.homepage         = 'https://gameanalytics.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'GameAnalytics' => 'sdk@gameanalytics.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'GA-SDK-IOS'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
