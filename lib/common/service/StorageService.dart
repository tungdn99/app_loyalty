import 'package:localstorage/localstorage.dart';
import 'package:my_app/common/constants/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constants.TOKEN_NAME);
  }

  static removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(Constants.TOKEN_NAME);
  }

  static setToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(Constants.TOKEN_NAME, token);
  }

  static setLocalStore(String key, String value) {
    final LocalStorage storage = new LocalStorage('set_storage');
    storage.setItem(key, value);
  }

  static getLocalStore(String key) async {
    final LocalStorage storage = new LocalStorage('get_storage');
    return storage.getItem(key);
  }

  static setUUID(String uuid) async {
    // const newUserId = uuid.replaceAll("-", "");
    // setLocalStore("uuid", newUserId);
  }

  static getUUID() {
    return getLocalStore("uuid");
  }
}
