
import '../../core/user_info.dart';

abstract class BaseDataSource {
  Map<String, String> get authHeaders => userInfo.getAuthData();
}