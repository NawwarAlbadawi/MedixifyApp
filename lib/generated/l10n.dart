// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To Our App`
  String get On_boarding_title {
    return Intl.message(
      'Welcome To Our App',
      name: 'On_boarding_title',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_Now {
    return Intl.message(
      'Start Now',
      name: 'start_Now',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue`
  String get login_to_continue {
    return Intl.message(
      'Login to continue',
      name: 'login_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Email address or Phone number`
  String get Login_Email_or_Phone {
    return Intl.message(
      'Email address or Phone number',
      name: 'Login_Email_or_Phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Login_password {
    return Intl.message(
      'Password',
      name: 'Login_password',
      desc: '',
      args: [],
    );
  }

  /// `Email or Phone mustn't be empty`
  String get email_validate {
    return Intl.message(
      'Email or Phone mustn\'t be empty',
      name: 'email_validate',
      desc: '',
      args: [],
    );
  }

  /// `Can't find account`
  String get login_error {
    return Intl.message(
      'Can\'t find account',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Name mustn't be empty`
  String get name_validate {
    return Intl.message(
      'Name mustn\'t be empty',
      name: 'name_validate',
      desc: '',
      args: [],
    );
  }

  /// `Phone mustn't be empty`
  String get phone_validate {
    return Intl.message(
      'Phone mustn\'t be empty',
      name: 'phone_validate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct number`
  String get phone_validate2 {
    return Intl.message(
      'Please enter correct number',
      name: 'phone_validate2',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy name mustn't be empty`
  String get pharmacy_name_validate {
    return Intl.message(
      'Pharmacy name mustn\'t be empty',
      name: 'pharmacy_name_validate',
      desc: '',
      args: [],
    );
  }

  /// `City mustn't be empty`
  String get city_validate {
    return Intl.message(
      'City mustn\'t be empty',
      name: 'city_validate',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy address mustn't be empty`
  String get pharmacy_address_validate {
    return Intl.message(
      'Pharmacy address mustn\'t be empty',
      name: 'pharmacy_address_validate',
      desc: '',
      args: [],
    );
  }

  /// `Password mustn't be empty`
  String get password_validate1 {
    return Intl.message(
      'Password mustn\'t be empty',
      name: 'password_validate1',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get password_validate2 {
    return Intl.message(
      'Password is too short',
      name: 'password_validate2',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get Register_now {
    return Intl.message(
      'Register Now',
      name: 'Register_now',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get Dont_have_an_account {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'Dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Please register to login`
  String get please_register_to_login {
    return Intl.message(
      'Please register to login',
      name: 'please_register_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get Register_Email {
    return Intl.message(
      'Email address',
      name: 'Register_Email',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get Register_Phone_number {
    return Intl.message(
      'Phone number',
      name: 'Register_Phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Register_Password {
    return Intl.message(
      'Password',
      name: 'Register_Password',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy name`
  String get Register_pharmacy_name {
    return Intl.message(
      'Pharmacy name',
      name: 'Register_pharmacy_name',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get Register_city {
    return Intl.message(
      'City',
      name: 'Register_city',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy address`
  String get Register_pharmacy_address {
    return Intl.message(
      'Pharmacy address',
      name: 'Register_pharmacy_address',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get orders {
    return Intl.message(
      'orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search for medicine`
  String get search_med {
    return Intl.message(
      'Search for medicine',
      name: 'search_med',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get Account_Information {
    return Intl.message(
      'Account Information',
      name: 'Account_Information',
      desc: '',
      args: [],
    );
  }

  /// `Commercial name`
  String get Commercial_name {
    return Intl.message(
      'Commercial name',
      name: 'Commercial_name',
      desc: '',
      args: [],
    );
  }

  /// `Scientific name `
  String get Scientific_name {
    return Intl.message(
      'Scientific name ',
      name: 'Scientific_name',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get Company {
    return Intl.message(
      'Company',
      name: 'Company',
      desc: '',
      args: [],
    );
  }

  /// `Available quantity`
  String get Available_quantity {
    return Intl.message(
      'Available quantity',
      name: 'Available_quantity',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date`
  String get Expiration_date {
    return Intl.message(
      'Expiration date',
      name: 'Expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `S.P`
  String get SP {
    return Intl.message(
      'S.P',
      name: 'SP',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `{howMany, plural, one{Sent} two{In Preparation} other{Delivered}}`
  String orderStatus(num howMany) {
    return Intl.plural(
      howMany,
      one: 'Sent',
      two: 'In Preparation',
      other: 'Delivered',
      name: 'orderStatus',
      desc: '',
      args: [howMany],
    );
  }

  /// `{howMany, plural, one{Unpaid} other{Paid}}`
  String orderPaymentStatus(num howMany) {
    return Intl.plural(
      howMany,
      one: 'Unpaid',
      other: 'Paid',
      name: 'orderPaymentStatus',
      desc: '',
      args: [howMany],
    );
  }

  /// `Profile_Details`
  String get Profile_Details {
    return Intl.message(
      'Profile_Details',
      name: 'Profile_Details',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get My_Cart {
    return Intl.message(
      'My Cart',
      name: 'My_Cart',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `New password does not match.Enter New password again here`
  String get change_password_validate {
    return Intl.message(
      'New password does not match.Enter New password again here',
      name: 'change_password_validate',
      desc: '',
      args: [],
    );
  }

  /// `The password has been changed successfully`
  String get password_changed {
    return Intl.message(
      'The password has been changed successfully',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Discover a new world of pharmacies`
  String get onboarding {
    return Intl.message(
      'Discover a new world of pharmacies',
      name: 'onboarding',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
