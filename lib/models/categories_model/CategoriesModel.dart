

class CategoriesModel {


  CategoriesModel.fromJson(Map<String,dynamic>json) {


    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }


  List<Data> ?data=[];




}

/// id : 1
/// Category_name : "Painkillers"
/// Arabic_Category_name : "مسكنات"

class Data {


  Data.fromJson(dynamic json) {
    id = json['id'];
    categoryName = json['Category_name'];
    arabicCategoryName = json['Arabic_Category_name'];
    image=json['image'];
  }
  int ?id;
  String ?categoryName;
  String ?arabicCategoryName;
  String ?image;


}