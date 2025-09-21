import 'package:one_studio_task/core/error_handling/exceptions.dart';

class ErrorHelper {
  static AppException handleCacheError(String message) {
    return CacheException(message);
  }
}
