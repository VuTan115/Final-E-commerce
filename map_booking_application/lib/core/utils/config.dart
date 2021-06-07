import 'package:map_booking_application/core/utils/enumeration.dart';

class Configuration {
  // System
  static bool isDevelopment = true;

  // App
  static const String appKey = 'G-999';

  static const AppMode defaultMode = AppMode.unknown;
  static const String defaultRegion = 'VN';
  static const String defaultLanguage = 'vi';
  static const String defaultTimeZone = 'utc';
  static const int pageTrackingLimited = 12;
  static const int onboardingViewsLimited = 1;

  // Gmaps
  static const String googleApiKey = 'AIzaSyA-RAaYeeOSkoQpqzRs2mLXaTT4x61X4Yo';
}
