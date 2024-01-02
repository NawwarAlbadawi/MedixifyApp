class CityModel {
  List<Data> ? cityData=[];

  CityModel.fromJson(Map<String,dynamic>json)
  {
   json['data'].forEach((v)
   {
     cityData!.add( new Data.formJson(v));
   });

  }

}
class Data {
  String ? cityArabic;
  String ? cityEnglish;
  int ? id;
  Data.formJson(Map<String,dynamic>json)
  {
    cityArabic=json['City_Arabic_name'];
    cityEnglish=json['City_name'];
    id=json['id'];
  }
}
