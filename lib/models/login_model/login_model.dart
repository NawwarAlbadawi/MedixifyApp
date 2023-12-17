
import 'package:intl/intl.dart';

class LoginModel
{
 late int? status;
  late String ?token;
 late String ?message;

  LoginModel.fromjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    token=json['access_token'];



  }
}
class Data {
  int ? id;
  String ? name;
  String ? email;
  String ? phone;
  String ? token;
  Data.fromjson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    token=json['token'];
  }


}