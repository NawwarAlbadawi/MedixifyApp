/// status : 1
/// message : "succes"
/// data : [{"status":2,"payment_status":2,"Warehouse_name":"nawwar","products":[{"id":2,"Price":2000,"category_id":1,"made_by_id":3,"image":"/images/ٍSYTAMOL.jpg","marketing_name":"ٍSYTAMOL","scientific_name":"PARACETAMOL","arabic_name":"سيتامول","exp_date":"2022-02-02","created_at":"2023-12-30 13:36:48","updated_at":"2023-12-30 13:36:48","made_by_name":"ADAMCO","made_by_Arabic_name":"أداما","Category_name":"Antibiotics","Arabic_Category_name":"مضادات حيوية","Quantity":3,"favorates":true,"PriceAllproducts":6000}],"PriceAllproducts":6000},{"status":2,"payment_status":2,"Warehouse_name":"nawwar","products":[{"id":2,"Price":2000,"category_id":1,"made_by_id":3,"image":"/images/ٍSYTAMOL.jpg","marketing_name":"ٍSYTAMOL","scientific_name":"PARACETAMOL","arabic_name":"سيتامول","exp_date":"2022-02-02","created_at":"2023-12-30 13:36:48","updated_at":"2023-12-30 13:36:48","made_by_name":"ADAMCO","made_by_Arabic_name":"أداما","Category_name":"Antibiotics","Arabic_Category_name":"مضادات حيوية","Quantity":3,"favorates":true,"PriceAllproducts":6000}],"PriceAllproducts":6000}]

class OrderModel {


  OrderModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  int ?status;
 String? message;
  List<Data> ?data;




}

/// status : 2
/// payment_status : 2
/// Warehouse_name : "nawwar"
/// products : [{"id":2,"Price":2000,"category_id":1,"made_by_id":3,"image":"/images/ٍSYTAMOL.jpg","marketing_name":"ٍSYTAMOL","scientific_name":"PARACETAMOL","arabic_name":"سيتامول","exp_date":"2022-02-02","created_at":"2023-12-30 13:36:48","updated_at":"2023-12-30 13:36:48","made_by_name":"ADAMCO","made_by_Arabic_name":"أداما","Category_name":"Antibiotics","Arabic_Category_name":"مضادات حيوية","Quantity":3,"favorates":true,"PriceAllproducts":6000}]
/// PriceAllproducts : 6000

class Data {


  Data.fromJson(dynamic json) {
    status = json['status'];
    paymentStatus = json['payment_status'];
    warehouseName = json['Warehouse_name'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    priceAllproducts = json['PriceAllproducts'];
  }
  int ?status;
  int  ?paymentStatus;
  String  ?warehouseName;
  List<Products> ? products=[];
  int  ?priceAllproducts;




}

/// id : 2
/// Price : 2000
/// category_id : 1
/// made_by_id : 3
/// image : "/images/ٍSYTAMOL.jpg"
/// marketing_name : "ٍSYTAMOL"
/// scientific_name : "PARACETAMOL"
/// arabic_name : "سيتامول"
/// exp_date : "2022-02-02"
/// created_at : "2023-12-30 13:36:48"
/// updated_at : "2023-12-30 13:36:48"
/// made_by_name : "ADAMCO"
/// made_by_Arabic_name : "أداما"
/// Category_name : "Antibiotics"
/// Arabic_Category_name : "مضادات حيوية"
/// Quantity : 3
/// favorates : true
/// PriceAllproducts : 6000

class Products {


  Products.fromJson(dynamic json) {
    id = json['id'];
    price = json['Price'];
    categoryId = json['category_id'];
    madeById = json['made_by_id'];
    image = json['image'];
    marketingName = json['marketing_name'];
    scientificName = json['scientific_name'];
    arabicName = json['arabic_name'];
    expDate = json['exp_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    madeByName = json['made_by_name'];
    madeByArabicName = json['made_by_Arabic_name'];
    categoryName = json['Category_name'];
    arabicCategoryName = json['Arabic_Category_name'];
    quantity = json['Quantity'];
    favorates = json['favorates'];
    priceAllproducts = json['PriceAllproducts'];
  }
  int? id;
  int? price;
  int? categoryId;
  int? madeById;
  String? image;
  String ?marketingName;
  String ?scientificName;
  String ?arabicName;
  String ?expDate;
  String ?createdAt;
  String ?updatedAt;
  String ?madeByName;
  String ?madeByArabicName;
  String ?categoryName;
  String ?arabicCategoryName;
    int ?quantity;
  bool ? favorates;
  int  ? priceAllproducts;

}