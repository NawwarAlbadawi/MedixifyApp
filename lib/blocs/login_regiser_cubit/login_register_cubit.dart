
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/models/login_model/login_model.dart';
import 'package:medixify/models/register_error/register_error.dart';
import 'package:medixify/shared/network/local/shared_preferebces.dart';
import 'package:medixify/shared/network/remote/dio_helper.dart';

import '../../shared/constans/constans.dart';
import 'login_register_states.dart';


class LoginAndRegisterCubit extends Cubit<LoginAndRegisterStates>
{
LoginAndRegisterCubit ():super(LoginInitialState());
static LoginAndRegisterCubit get(context)=>BlocProvider.of(context);
 IconData Scure_Icon=Icons.visibility_off_rounded;
 bool showPassword=true;

 void changePasswordVisibility()
 {
   showPassword?Scure_Icon=Icons.remove_red_eye_outlined:Scure_Icon= Icons.visibility_off_rounded;
   showPassword=!showPassword;

   emit(ChangePasswordVisibilityState());

 }
 LoginModel ? loginModel;
 void postLoginData(
     {
     required String email,
     required String password
     }
     )
 {

   emit(LoadingLoginState());
   DioHelper.postData(path: 'login',
   data: {
     'Email_address_or_Phone_number':email,
     'Password':password
   }).then((value) {
     loginModel=LoginModel.fromjson(value.data);
     emit(PostLoginDataState(loginModel!));
   }
   ).catchError((error){
     print(error.toString());
     emit(ErrorLoginState(error));
   });

 }
 void selectCity()
 {
   emit(SelectCityState());
 }
RegisterErrorModel ? registerErrorModel;
void postRegisterData(
    {
      required String name,
      required String email,
      required String password,
      required String phone,
      required String pharmacyName,
      required String pharmacyAddress,
    }
    )
{

  emit(LoadingRegisterState());
  DioHelper.postData(path: 'register/pharmace',
      data: {
        'Full_name' : name,
        'Email_address':email,
        'Phone_number' : phone,
        'Password' :password,
        'Pharmacy_name' :pharmacyName,
        'City' : 1,
        'Pharmacy_address' : pharmacyAddress

      }).then((value) {


    emit(PostRegisterState());
  }
  ).catchError((error){

    if(error is DioException)
      {
       

      registerErrorModel=RegisterErrorModel.fromJson(error.response!.data);
      }


    emit(ErrorRegisterState(registerErrorModel!));
  });

}





}