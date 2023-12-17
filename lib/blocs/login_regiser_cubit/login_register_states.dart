import 'package:medixify/models/login_model/login_model.dart';
import 'package:medixify/models/register_error/register_error.dart';

abstract class LoginAndRegisterStates {}
class LoginInitialState extends LoginAndRegisterStates{}
class ChangePasswordVisibilityState extends LoginAndRegisterStates {}
class LoadingLoginState extends LoginAndRegisterStates {}
class PostLoginDataState extends LoginAndRegisterStates {
  LoginModel ?loginModel;

  PostLoginDataState( this.loginModel);


}
class ErrorLoginState extends LoginAndRegisterStates {
  String error;
  ErrorLoginState(this.error)
  {
    print(error.toString());
  }
}
class SelectCityState extends LoginAndRegisterStates {

}

class LoadingRegisterState extends LoginAndRegisterStates {}
class PostRegisterState extends LoginAndRegisterStates {



}
class ErrorRegisterState extends LoginAndRegisterStates {
  RegisterErrorModel ? registerErrorModel;
  ErrorRegisterState(this.registerErrorModel);

}


