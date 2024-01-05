// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// AndroidOptions _getAndroidOptions() => const AndroidOptions(
//       encryptedSharedPreferences: true,
//     );

// class SecureStorageUtils {
// static final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

// static final storage = FlutterSecureStorage();

// static Future<String> getAccessToken() async {
//   String value = await storage.read(key: "access_token");
//   return value;
// }

// static Future<void> setAccessToken(String accessToken) async {
//   return storage.write(key: "access_token", value: accessToken);
// }

// static Future<void> resetStorage() async {
//   return storage.deleteAll();
// }

// static Future<void> deleteAll() async {
//   await storage.deleteAll();
// }

// Read all values
// Map<String, String> allValues = await storage.readAll();

// // Delete value
// await storage.delete(key: key);

// // Delete all
// await storage.deleteAll();
// }

class StorageUtils {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> clear() async {
    bool result = await _prefs.clear();

    return result;
  }

  static String? getAccessToken() {
    return _prefs.getString('access_token');
  }

  static setAccessToken(String userId) async {
    _prefs.setString('access_token', userId);
  }

  static String? getUserId() {
    return _prefs.getString('user_id');
  }

  static setUserId(String userId) async {
    _prefs.setString('user_id', userId);
  }
}
