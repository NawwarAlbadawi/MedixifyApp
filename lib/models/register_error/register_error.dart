class RegisterErrorModel {
  String? message;




  RegisterErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
   // errors = json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }



}

class Errors {
  List<String>? emailAddress;
  List<String>? phoneNumber;
  List<String>? pharmacyName;



  Errors.fromJson(Map<String, dynamic> json) {
    emailAddress = json['Email_address'].cast<String>();
    phoneNumber = json['Phone_number'].cast<String>();
    pharmacyName = json['Pharmacy_name'].cast<String>();
  }


}