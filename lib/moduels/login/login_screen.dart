
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/cubit/login_register_cubit.dart';
import 'package:medixify/blocs/cubit/login_register_states.dart';
import 'package:medixify/layout/medixify/medixify.dart';


import '../../shared/components/MatrialButton.dart';
import '../../shared/components/form_field.dart';
import '../../shared/components/navigator.dart';
import '../../shared/style/colors.dart';
import '../register/register.dart';


class LoginScreen extends StatelessWidget {
 LoginScreen({super.key});
  var emailController=TextEditingController();
 var passwordController=TextEditingController();
 var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginAndRegisterCubit(),

      child: BlocConsumer<LoginAndRegisterCubit,LoginAndRegisterStates>(
        listener: (context,states){},
        builder: (context,states){
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
                            AssetImage('assets/images/login.jpeg')),
                        ),
                        Text('Login to continue !',
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
                              return 'Email or Phone mustn\'t be empty';
                            }
                            return null;
                          },
                          prefix:Icons.login_outlined ,
                          label: 'Email address or Phone number',
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
                              return 'Password mustn\'t be empty';
                            }
                            else if (value.length<8)
                              {
                                return 'Password is too short';
                              }
                            return null;
                          },
                          prefix:Icons.lock_outline ,
                          label: 'Password',
                          needscure: LoginAndRegisterCubit.get(context).showPassword,
                          suffix: LoginAndRegisterCubit.get(context).Scure_Icon,
                          suffixBotton: (){
                          LoginAndRegisterCubit.get(context).changePasswordVisibility();
                          },
                          onChanged: (value){
                          if(formKey.currentState!.validate());
                          },


                        ),
                        SizedBox(height: 40,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            color: YankeesBlue
                          ),
                          child: BuildMatrialBotton(onPressed: (){
                            if(formKey.currentState!.validate())
                              {
                                BuildNavigator(context:context,widget: MedixifyApp());
                              }
                          },
                              text: 'Sign In',
                          color:SilverChalice,),

                        ),
                        SizedBox(height: 30,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text('Don\'t have an account ?',
                              style: TextStyle(
                                  fontSize: 15
                              ),),

                            TextButton(onPressed: (){
                             BuildNavigator(
                               context: context,
                               widget: RegisterScreen()
                             );
                            },
                                child: Text('Register Now',
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
      )
    );
  }
}
