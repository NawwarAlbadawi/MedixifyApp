// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(howMany) =>
      "${Intl.plural(howMany, one: 'غير مدفوع', other: 'مدفوع')}";

  static String m1(howMany) =>
      "${Intl.plural(howMany, one: 'تم الٳرسال', two: 'قيد التحضير', other: 'مستلمة')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Account_Information":
            MessageLookupByLibrary.simpleMessage(" معلومات الحساب "),
        "AddToCart": MessageLookupByLibrary.simpleMessage("اضافة الى السلة"),
        "Addedtocart":
            MessageLookupByLibrary.simpleMessage("تم الاضافة الى السلة"),
        "Amount": MessageLookupByLibrary.simpleMessage("الكمية"),
        "Available_quantity":
            MessageLookupByLibrary.simpleMessage("الكمية المتاحة "),
        "Category": MessageLookupByLibrary.simpleMessage("الصنف"),
        "Commercial_name":
            MessageLookupByLibrary.simpleMessage("الاسم التجاري"),
        "Company": MessageLookupByLibrary.simpleMessage("الشركة المصنعة"),
        "Dont_have_an_account":
            MessageLookupByLibrary.simpleMessage("لا تمتلك حساب ؟"),
        "Expiration_date":
            MessageLookupByLibrary.simpleMessage("تاريخ الانتهاء"),
        "Login_Email_or_Phone": MessageLookupByLibrary.simpleMessage(
            "البريد الالكتروني او رقم الهاتف"),
        "Login_password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "Logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "My_Cart": MessageLookupByLibrary.simpleMessage("سلَتي"),
        "On_boarding_title":
            MessageLookupByLibrary.simpleMessage("مرحبا بك في تطبيقنا"),
        "OrderNow": MessageLookupByLibrary.simpleMessage("اطلب الان"),
        "Price": MessageLookupByLibrary.simpleMessage("السعر"),
        "Profile_Details":
            MessageLookupByLibrary.simpleMessage("تفاصيل الحساب"),
        "Register": MessageLookupByLibrary.simpleMessage("سجل الان"),
        "Register_Email":
            MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
        "Register_Password":
            MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "Register_Phone_number":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "Register_city": MessageLookupByLibrary.simpleMessage("المدينة"),
        "Register_pharmacy_address":
            MessageLookupByLibrary.simpleMessage("عنوان الصيدلية"),
        "Register_pharmacy_name":
            MessageLookupByLibrary.simpleMessage("اسم الصيدلية"),
        "SP": MessageLookupByLibrary.simpleMessage("ل.س"),
        "Scientific_name": MessageLookupByLibrary.simpleMessage("الاسم العلمي"),
        "Search": MessageLookupByLibrary.simpleMessage("البحث"),
        "Sign_up": MessageLookupByLibrary.simpleMessage("تسجيل"),
        "Total": MessageLookupByLibrary.simpleMessage("الاجمالي"),
        "change_password":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "change_password_validate": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور الجديدة غير متطابقة. ادخل كلمة المرور الجديدة مرة أخرى هنا"),
        "city_validate":
            MessageLookupByLibrary.simpleMessage("المدينة يجب الا تكون فارغة"),
        "confirm_password":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "createAccount": MessageLookupByLibrary.simpleMessage("انشاء حساب"),
        "email_validate":
            MessageLookupByLibrary.simpleMessage("الايميل يجب الا يكون فارغ"),
        "favorite": MessageLookupByLibrary.simpleMessage("المفضلة"),
        "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "loginMessage":
            MessageLookupByLibrary.simpleMessage("تم تسجيل الدخول بنجاح"),
        "login_error":
            MessageLookupByLibrary.simpleMessage(" لايمكن ايجاد الحساب"),
        "login_to_continue":
            MessageLookupByLibrary.simpleMessage("سجل الدخول للاستمرار"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم"),
        "name_validate":
            MessageLookupByLibrary.simpleMessage("الاسم يجب الا يكون فارغ"),
        "onboarding":
            MessageLookupByLibrary.simpleMessage("اكتشف عالم جديد للصيدليات"),
        "orderPaymentStatus": m0,
        "orderStatus": m1,
        "orders": MessageLookupByLibrary.simpleMessage("الطلبات"),
        "password_changed":
            MessageLookupByLibrary.simpleMessage("تم تغيير كلمة المرور بنجاح"),
        "password_validate1": MessageLookupByLibrary.simpleMessage(
            "كلمة السر يجب الا تكون فارغة"),
        "password_validate2":
            MessageLookupByLibrary.simpleMessage("كلمة قصيرة جدا"),
        "pharmacy_address_validate": MessageLookupByLibrary.simpleMessage(
            "عنوان الصيدلية يجب الا يكون فارغ"),
        "pharmacy_name_validate": MessageLookupByLibrary.simpleMessage(
            "اسم الصيدلية يجب الا يكون فارغ"),
        "phone_validate": MessageLookupByLibrary.simpleMessage(
            "رقم الهاتف يجب الا يكون فارغ"),
        "phone_validate2":
            MessageLookupByLibrary.simpleMessage("رجاءا ادخل رقم صحيح"),
        "please_register_to_login": MessageLookupByLibrary.simpleMessage(
            "ادخل المعلومات المطلوبة لتسجيل الدخول "),
        "profile": MessageLookupByLibrary.simpleMessage("الحساب"),
        "profileUpdate": MessageLookupByLibrary.simpleMessage(
            "تم تغيير معلومات الحساب  بنجاح"),
        "remainingProducts": MessageLookupByLibrary.simpleMessage(
            "الكمية المتبقية من الادوية غير متوفرة"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "search_med": MessageLookupByLibrary.simpleMessage("ابحث عن دواء"),
        "sign_in": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "start_Now": MessageLookupByLibrary.simpleMessage("ابدأ الان "),
        "youOrder": MessageLookupByLibrary.simpleMessage("طلبك")
      };
}
