import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static late final  SharedPreferences sharedPreferences;


  static Future init() async => sharedPreferences = await SharedPreferences.getInstance();


  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.getInt(key);
  }

  static Future saveData({
    required String key,
    required  value,
  }) async {
    //if (value is String) return await sharedPreferences.setString(key, value);
    return await sharedPreferences.setInt(key, value);
    //if (value is bool) return await sharedPreferences.setBool(key, value);

   // return await sharedPreferences.setDouble(key, value);
  }

  static Future removeData({
    required String key,
  }) async
  {
    return await sharedPreferences.remove(key);
  }
}