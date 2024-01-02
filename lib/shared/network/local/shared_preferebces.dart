
import 'package:shared_preferences/shared_preferences.dart';
class CachHelper{
  static  SharedPreferences? sharedPreferences;
  // Obtain shared preferences.

 static  InitSharedPreferences() async
  {
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> setSharedPreferences({required dynamic value,
     required String key}) async
  {
    if(value is String)
      {
      return await  sharedPreferences!.setString(key, value);
      }
    else if(value is int)
      {
        return await  sharedPreferences!.setInt(key, value);
      }
    else if (value is bool)
      {
        return await  sharedPreferences!.setBool(key, value);
      }
    return await sharedPreferences!.setDouble(key, value);

  }

 static getSharedPreferences(
      String key)
  {


      return  sharedPreferences!.get(key);


  }
  static Future<bool> deleteSharedPreferences({
    required String key
})async
  {
    return await sharedPreferences!.remove(key);
  }


}