
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/cubit/login_register_states.dart';

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




}