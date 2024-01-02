import 'package:medixify/shared/network/local/shared_preferebces.dart';

class ProfileModel {
Data ? data ;
ProfileModel.fromjson( Map<String,dynamic>json)
{
  data=Data.fromjson(json['data']);
}

}
class Data {
String ? name;
String ?email;
String  ?phone;
String ?pharmacyName;
String ?en_city;
String ?ar_city;
String ? pharmacyAddress;
// int ? userId;












Data.fromjson(
    Map<String,dynamic>json
    )
{
  // userId=json['id'];
  // CachHelper.setSharedPreferences(value: userId, key:"user Id");
  email=json['Email_address'];
  phone=json['Phone_number'];
  name=json['Full_name'];
  pharmacyName=json['Pharmacy_name'];
  en_city=json['City_name'];
  ar_city=json['City_Arabic_name'];
  pharmacyAddress=json['Pharmacy_address'];

}

}
