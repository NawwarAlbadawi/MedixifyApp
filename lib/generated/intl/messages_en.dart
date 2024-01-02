// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(howMany) =>
      "${Intl.plural(howMany, one: 'Unpaid', other: 'Paid')}";

  static String m1(howMany) =>
      "${Intl.plural(howMany, one: 'Sent', two: 'In Preparation', other: 'Delivered')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Account_Information":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "Amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "Available_quantity":
            MessageLookupByLibrary.simpleMessage("Available quantity"),
        "Category": MessageLookupByLibrary.simpleMessage("Category"),
        "Commercial_name":
            MessageLookupByLibrary.simpleMessage("Commercial name"),
        "Company": MessageLookupByLibrary.simpleMessage("Company"),
        "Dont_have_an_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ?"),
        "Expiration_date":
            MessageLookupByLibrary.simpleMessage("Expiration date"),
        "Login_Email_or_Phone": MessageLookupByLibrary.simpleMessage(
            "Email address or Phone number"),
        "Login_password": MessageLookupByLibrary.simpleMessage("Password"),
        "Logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "My_Cart": MessageLookupByLibrary.simpleMessage("My Cart"),
        "On_boarding_title":
            MessageLookupByLibrary.simpleMessage("Welcome To Our App"),
        "Price": MessageLookupByLibrary.simpleMessage("Price"),
        "Profile_Details":
            MessageLookupByLibrary.simpleMessage("Profile_Details"),
        "Register": MessageLookupByLibrary.simpleMessage("Register"),
        "Register_Email": MessageLookupByLibrary.simpleMessage("Email address"),
        "Register_Password": MessageLookupByLibrary.simpleMessage("Password"),
        "Register_Phone_number":
            MessageLookupByLibrary.simpleMessage("Phone number"),
        "Register_city": MessageLookupByLibrary.simpleMessage("City"),
        "Register_now": MessageLookupByLibrary.simpleMessage("Register Now"),
        "Register_pharmacy_address":
            MessageLookupByLibrary.simpleMessage("Pharmacy address"),
        "Register_pharmacy_name":
            MessageLookupByLibrary.simpleMessage("Pharmacy name"),
        "SP": MessageLookupByLibrary.simpleMessage("S.P"),
        "Scientific_name":
            MessageLookupByLibrary.simpleMessage("Scientific name "),
        "Search": MessageLookupByLibrary.simpleMessage("Search"),
        "Sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "Total": MessageLookupByLibrary.simpleMessage("Total"),
        "change_password":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "change_password_validate": MessageLookupByLibrary.simpleMessage(
            "New password does not match.Enter New password again here"),
        "city_validate":
            MessageLookupByLibrary.simpleMessage("City mustn\'t be empty"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
        "email_validate": MessageLookupByLibrary.simpleMessage(
            "Email or Phone mustn\'t be empty"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "full_name": MessageLookupByLibrary.simpleMessage("Full name"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "login_error":
            MessageLookupByLibrary.simpleMessage("Can\'t find account"),
        "login_to_continue":
            MessageLookupByLibrary.simpleMessage("Login to continue"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "name_validate":
            MessageLookupByLibrary.simpleMessage("Name mustn\'t be empty"),
        "onboarding": MessageLookupByLibrary.simpleMessage(
            "Discover a new world of pharmacies"),
        "orderPaymentStatus": m0,
        "orderStatus": m1,
        "orders": MessageLookupByLibrary.simpleMessage("orders"),
        "password_changed": MessageLookupByLibrary.simpleMessage(
            "The password has been changed successfully"),
        "password_validate1":
            MessageLookupByLibrary.simpleMessage("Password mustn\'t be empty"),
        "password_validate2":
            MessageLookupByLibrary.simpleMessage("Password is too short"),
        "pharmacy_address_validate": MessageLookupByLibrary.simpleMessage(
            "Pharmacy address mustn\'t be empty"),
        "pharmacy_name_validate": MessageLookupByLibrary.simpleMessage(
            "Pharmacy name mustn\'t be empty"),
        "phone_validate":
            MessageLookupByLibrary.simpleMessage("Phone mustn\'t be empty"),
        "phone_validate2":
            MessageLookupByLibrary.simpleMessage("Please enter correct number"),
        "please_register_to_login":
            MessageLookupByLibrary.simpleMessage("Please register to login"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search_med":
            MessageLookupByLibrary.simpleMessage("Search for medicine"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
        "start_Now": MessageLookupByLibrary.simpleMessage("Start Now")
      };
}
