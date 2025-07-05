import 'package:event_app/service/api_url.dart';
import 'package:event_app/utils/app_const/app_const.dart';

class ImageHandler {
  static String imagesHandle(String? url) {
    if (url == null || url.isEmpty) {
      return AppConstants.resturentImage;
    }

    if (url.startsWith('http')) {
      return url; // If the URL starts with 'http', return as is
    } else {
      return '${ApiUrl.imageUrl}$url';
      //  return ApiUrl.imageUrl + url;
    }
  }
}
