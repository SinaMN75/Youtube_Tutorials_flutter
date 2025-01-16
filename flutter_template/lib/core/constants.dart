import 'package:flutter/foundation.dart';

abstract class AppConstants {
  static String baseUrl = kReleaseMode ? "https://example.com" : "https://example.com";
}
