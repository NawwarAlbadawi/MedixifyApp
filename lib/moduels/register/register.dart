
import 'package:flutter/material.dart';
import 'package:medixify/moduels/login/login_screen.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/form_field.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var pharmacyNameController=TextEditingController();
  var pharmacyAddressController=TextEditingController();
  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var local=S.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(),

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
                    child: Image(
                      image: AssetImage('assets/images/Sign_up.jpeg'),
                    ),
                  ),
                  Text(local.Register,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold

                  ),),
                  SizedBox(height: 10,),
                  Text(local.please_register_to_login,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500

                    ),),
                  SizedBox(height: 20,),
                  BuildFormField(controller:nameController ,
                    inputType: TextInputType.name,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Name mustn\'t be empty';
                      }
                      return null;
                    },
                    label: local.full_name,
                    prefix: Icons.person,

                  ),
                  SizedBox(height: 15,),
                   BuildFormField(controller:emailController ,
                       inputType: TextInputType.emailAddress,
                      validator: (value){
                         if(value!.isEmpty)
                         {
                           return 'Email mustn\'t be empty';
                         }
                        return null;
                       }, label: local.Register_Email,
                   prefix: Icons.email,),
                  SizedBox(height: 15,),
                  BuildFormField(controller:phoneController ,
                      inputType: TextInputType.phone,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Phone mustn\'t be empty';
                        }
                        else if(value.length<10)
                          {
                            return 'Please enter correct number';
                          }
                        return null;
                      },
                      label: local.Register_Phone_number,
                      prefix: Icons.phone_android,),
                  SizedBox(height: 15,),
                  BuildFormField(controller:passwordController ,
                      inputType: TextInputType.visiblePassword,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Password mustn\'t be empty';
                        }
                        else if(value.length<8)
                          {
                            return 'Password is too short';
                          }
                        return null;
                      },
                      label: local.Register_Password,
                       prefix: Icons.lock,),
                  SizedBox(height: 15,),
                  BuildFormField(controller:pharmacyNameController ,
                      inputType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Pharmacy name mustn\'t be empty';
                        }
                        return null;
                      },
                      label: local.Register_pharmacy_name,
                      prefix: Icons.person,),
                  SizedBox(height: 15,),
                  BuildFormField(controller:pharmacyAddressController ,
                      inputType: TextInputType.streetAddress,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return 'Pharmacy address mustn\'t be empty';
                        }
                        return null;
                      }, label: local.Register_pharmacy_address,
                    prefix: Icons.location_on, ),
                  SizedBox(height: 15,),

                  Center(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: YankeesBlue
                      ),
                      child: BuildMatrialBotton(onPressed:(){
                        if(formKey.currentState!.validate())
                          {
                            BuildNavigator(
                                context: context,
                                widget: LoginScreen()
                            );
                          }

                      } ,
                          text: local.Sign_up,
                        color: SilverChalice,

                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
