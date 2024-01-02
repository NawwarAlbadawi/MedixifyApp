class SearchModel{
  int ?status;
  List <Data>?data=[];
  SearchModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    json['data'].forEach((element)
    {
      data!.add(Data.fromJson(element));
    }
    );
  }
}







class Data {
  int ? id;
  int ? price;
  String ?image ;
  String? enMarketingName;
  String ?arMarketingName;
  bool? favorite;
  int ? quantity;
  String ? enFactory;
  String ? arFactory;
  String ?enCategory;
  String ?arCategory;
  String?scientificName;
  String?expDate;

  Data.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['Price'];
    image=json['image'];
    enMarketingName=json['marketing_name'];
    arMarketingName =json['arabic_name'];
    favorite=json['favorates'];
    quantity=json['Quantity'];
    enFactory=json['made_by_name'];
    arFactory=json['made_by_Arabic_name'];
    enCategory=json['Category_name'];
    arCategory=json['Arabic_Category_name'];
    scientificName=json['scientific_name'];
    expDate=json['exp_date'];


  }

}