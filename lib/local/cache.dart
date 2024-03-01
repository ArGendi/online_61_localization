import 'package:shared_preferences/shared_preferences.dart';

abstract class Cache{
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setLanguage(String langCode) async{
    await sharedPreferences.setString("language", langCode);
  } 

  static String? getLanguage(){
    return sharedPreferences.getString("language");
  }
}