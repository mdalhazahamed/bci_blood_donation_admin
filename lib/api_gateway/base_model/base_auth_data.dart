
import '../../core/user_info.dart';

class BaseAuthData {
  Map<String, String> get authHeaders => userInfo.getAuthData();
  Object? requestData;

}