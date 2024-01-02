
import 'package:intl/intl.dart';

class LoginModel
{
 late int? status;
  late String ?token;
 late String ?message;
 late int userId;

  LoginModel.fromjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    if(json['status']!=0)
      {
    token=json['access_token'];
    userId=json['pharmacy_id'];}



  }
}
// class Data {
//   int ? id;
//   String ? name;
//   String ? email;
//   String ? phone;
//   String ? token;
//   Data.fromjson(Map<String,dynamic>json)
//   {
//     id=json['id'];
//     name=json['name'];
//     email=json['email'];
//     phone=json['phone'];
//     token=json['token'];
//   }
//
//
// }