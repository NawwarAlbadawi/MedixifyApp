
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:medixify/layout/medixify/medixify.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:medixify/shared/components/custom_toast.dart';


import '../../blocs/login_regiser_cubit/login_register_cubit.dart';
import '../../blocs/login_regiser_cubit/login_register_states.dart';
import '../../generated/l10n.dart';
import '../../shared/components/MatrialButton.dart';
import '../../shared/components/form_field.dart';
import '../../shared/components/navigator.dart';
import '../../shared/components/navigator_and_replace.dart';
import '../../shared/constans/constans.dart';
import '../../shared/network/local/shared_preferebces.dart';
import '../../shared/style/colors.dart';
import '../register/register.dart';



class LoginScreen extends StatelessWidget {
 LoginScreen({super.key});
  var emailController=TextEditingController();
 var passwordController=TextEditingController();
 var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var local=S.of(context);
    return BlocConsumer<LoginAndRegisterCubit,LoginAndRegisterStates>(
      listener: (context,states){
        if(states is PostLoginDataState)
          {
            if(states.loginModel!.status==1)
              {
                CustomToast(
                  context: context,
                  message: local.loginMessage,
                  color: Colors.green
                );

                CachHelper.setSharedPreferences(value: states.loginModel!.token, key: 'token').then((value) {
                  CachHelper.setSharedPreferences(value: states.loginModel!.userId, key: 'userId').then((value) {
                    print(CachHelper.getSharedPreferences('token'));
                    print(CachHelper.getSharedPreferences('userId'));
                    token=states.loginModel!.token;


                    NavigatorAndReplace(
                        context: context,
                        widget: MedixifyApp()
                    );
                  });

                });

              }
            else if(states.loginModel!.status==0)
              {
                CustomToast(
                  color: basicColor,
                  context: context,
                  message: local.login_error
                );

              }

          }
      },
      builder: (context,states){
        var local=S.of(context);
        var cubit=LoginAndRegisterCubit.get(context);
        return Form(
          key: formKey,
          child: Scaffold(

            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image(image:
                          AssetImage('assets/images/Mobile login.png')),
                      ),
                      Text(local.login_to_continue,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,

                        ),) ,
                      SizedBox(
                        height: 20,
                      ),
                      BuildFormField(controller: emailController,
                        inputType: TextInputType.emailAddress,
                        validator:(value)
                        {
                          if(value!.isEmpty)
                          {
                            return local.email_validate;
                          }
                          return null;
                        },
                        prefix:Icons.login_outlined ,
                        label: S.of(context).Login_Email_or_Phone,
                        needscure: false,
                      ),
                      SizedBox(height: 20,),
                      BuildFormField(
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        validator:(value)
                        {
                          if(value!.isEmpty)
                          {
                            return local.password_validate1;
                          }
                          else if(value.length<8)
                            {
                              return local.password_validate2;
                            }

                          return null;
                        },
                        prefix:Icons.lock_outline ,
                        label: S.of(context).Login_password,
                        needscure: LoginAndRegisterCubit.get(context).showPassword,
                        suffix: LoginAndRegisterCubit.get(context).Scure_Icon,
                        suffixBotton: (){
                        LoginAndRegisterCubit.get(context).changePasswordVisibility();
                        },
                        onChanged: (value){


                        },


                      ),
                      SizedBox(height: 40,),
                      ConditionalBuilder(
                        condition: states is LoadingLoginState,
                        builder: (context)=>Center(child: CircularProgressIndicator()),
                        fallback:(context)=> Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: basicColor
                          ),
                          child: BuildMatrialBotton(onPressed: (){
                            if(formKey.currentState!.validate())
                              {
                                print(emailController.text);
                                print(passwordController.text);

                                cubit.postLoginData(
                                  email: emailController.text,
                                  password: passwordController.text
                                );

                              }

                          },
                              text: local.sign_in ,
                          color:SilverChalice,),
                        ),

                      ),
                      SizedBox(height: 30,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(local.Dont_have_an_account,
                            style: TextStyle(
                                fontSize: 15
                            ),),

                          TextButton(onPressed: (){
                           NavigateTo(
                             context: context,
                             widget: RegisterScreen()
                           );
                          },
                              child: Text(local.Register,
                                style: TextStyle(
                                    fontSize: 15,
                                  color: SilverChalice
                                ),))
                        ],
                      ),



                    ],
                  ),
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}
