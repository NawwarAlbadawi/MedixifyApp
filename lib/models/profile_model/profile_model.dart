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
int ?wallet;
String ?pharmacyName;
String ?city;
String ? pharmacyAddress;












Data.fromjson(
    Map<String,dynamic>json
    )
{
  email=json['Email_address'];
  phone=json['Phone_number'];
  wallet=json['wallet'];
  name=json['Full_name'];
  pharmacyName=json['Pharmacy_name'];
  city=json['City'];
  pharmacyAddress=json['Pharmacy_address'];

}

}
