

class UpdateProfileError {
  String? message;




  UpdateProfileError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // errors = json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }
}