
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/custom_toast.dart';
import 'package:medixify/shared/components/form_field.dart';

import '../../generated/l10n.dart';
import '../../shared/components/MatrialButton.dart';
import '../../shared/style/colors.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey=GlobalKey<FormState>();
    var passwordController=TextEditingController();
    var passwordController2=TextEditingController();
    var local=S.of(context);
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
        listener: (context,state){
          if(state is UpdateProfileSuccessesState)
            {
              CustomToast(
                context: context,
                message: local.password_changed,
                  color: SilverChalice
              );
            }
        },

         builder: (context,state)
      {
        return Form(
          key: formkey,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                local.change_password,
                style: TextStyle(
                  color: basicColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),

            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: double.infinity,

                      child: Image(
                        image: AssetImage('assets/images/Reset password.png'),
                      ),
                    ),
                    SizedBox(height: 15,),

                    BuildFormField(
                      controller:passwordController ,
                      inputType: TextInputType.visiblePassword,
                      validator: (value){
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
                      label: local.Register_Password,
                      prefix: Icons.lock,
                      radius: 30,
                      onChanged: (value)
                      {
                        if(formkey.currentState!.validate());
                      },
                    ),
                    SizedBox(height: 20,),
                    BuildFormField(
                      controller:passwordController2 ,
                      inputType: TextInputType.visiblePassword,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return local.password_validate1;
                        }
                        else if(value.length<8)
                        {
                          return local.password_validate2;
                        }
                        else if(value !=passwordController.text)
                        {
                          return local.change_password_validate ;
                        }
                        return null;
                      },
                      label: local.confirm_password,
                      prefix: Icons.lock,
                      radius: 30,
                      onChanged: (value)
                      {
                        if(formkey.currentState!.validate());
                      },
                    ),
                    SizedBox(height:25,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: basicColor
                      ),
                      child: BuildMatrialBotton(onPressed: (){
                        if(formkey.currentState!.validate())
                          {
                            MedixifyCubit.get(context).updateProfileData(
                              password: passwordController.text
                            );
                            //Navigator.pop(context);
                          }
                      },
                        text:local.save ,
                        color:SilverChalice,

                      ),
                    )





                  ],
                ),
              ),
            ),
          ),
        ) ;
      },
    );
  }
}
