
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/blocs/login_regiser_cubit/login_register_cubit.dart';
import 'package:medixify/blocs/login_regiser_cubit/login_register_states.dart';
import 'package:medixify/models/city_model.dart';
import 'package:medixify/moduels/login/login_screen.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/custom_toast.dart';
import 'package:medixify/shared/components/form_field.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/style/colors.dart';
import 'package:toastification/toastification.dart';

import '../../generated/l10n.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var pharmacyNameController=TextEditingController();
  var pharmacyAddressController=TextEditingController();
  var cityController=TextEditingController();



  var formKey=GlobalKey<FormState>();

  int ? id;



  @override
  Widget build(BuildContext context) {
    var local=S.of(context);
    return BlocConsumer<LoginAndRegisterCubit,LoginAndRegisterStates>(
    listener: (context,state){
      if(state is PostRegisterState)
        {

        NavigateTo(
        context: context,
        widget: LoginScreen()
        );
        }
      else if(state is ErrorRegisterState)
        {
          CustomToast(
            color: basicColor,
            context: context,
            message: '${state.registerErrorModel!.message}'

          );



        }
    },
      builder: (context,state){

   var cubit=LoginAndRegisterCubit.get(context);


      return Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)) ,

          ),
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
                        image: AssetImage('assets/images/Sign up.png'),
                      ),
                    ),
                    Text(local.Register,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        color: basicColor

                      ),),
                    SizedBox(height: 10,),
                    Text(local.please_register_to_login,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        color: SilverChalice

                      ),),
                    SizedBox(height: 20,),
                    BuildFormField(controller:nameController ,
                      inputType: TextInputType.name,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return local.name_validate;
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
                          return local.email_validate;
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
                          return local.phone_validate;
                        }
                        else if(value.length!=10)
                        {
                          return local.phone_validate2;
                        }
                        return null;
                      },
                      label: local.Register_Phone_number,
                      prefix: Icons.phone_android,),
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
                          return local.password_validate2 ;
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
                          return local.pharmacy_name_validate;
                        }
                        return null;
                      },
                      label: local.Register_pharmacy_name,
                      prefix: Icons.person,
                    onChanged: (value){
                      if(formKey.currentState!.validate());
                    },),
                    SizedBox(height: 15,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: PopupMenuButton(

                            icon: Icon(Icons.location_city_outlined),

                            itemBuilder: (context)=>List.generate(
                                cubit.cityModel!.cityData!.length,
                                    (index)=>PopupMenuItem(child: Text('${CommonCubit.get(context).isarabic?
                                   cubit.arabicCity[index]:cubit.englishCity[index]}',
                                    selectionColor: Colors.red,),
                                    value:cubit.cityModel!.cityData![index] ,)
                            ),
                            onSelected: (newValue){
                              id=newValue.id;
                              cityController.text=(CommonCubit.get(context).isarabic?newValue.cityArabic:newValue.cityEnglish)!;
                            },
                          ) ,
                          labelText: local.Register_city
                      ),
                      controller: cityController,
                      keyboardType: TextInputType.none,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return local.city_validate;
                        }
                        return null;
                      },
                      onChanged: (value){},
                      cursorColor: Colors.white,
                    //  initialValue: 'Select City from the icon',

                      onTap: (){

                      },
                    ),
                    SizedBox(height: 15,),
                    BuildFormField(controller:pharmacyAddressController ,
                      inputType: TextInputType.streetAddress,
                      validator: (value){
                        if(value!.isEmpty)
                        {
                          return local.pharmacy_address_validate;
                        }
                        return null;
                      }, label: local.Register_pharmacy_address,
                      prefix: Icons.location_on, ),
                    SizedBox(height: 15,),
                    ConditionalBuilder(

                      condition: state is LoadingRegisterState ,
                        builder: (context)=> Center(child: CircularProgressIndicator(),),

                      fallback: (context)=> Center(
              child: Container(
              width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: basicColor
                ),
                child: BuildMatrialBotton(onPressed:(){
                  if(formKey.currentState!.validate())
                  {
                    LoginAndRegisterCubit.get(context).postRegisterData(
                        name:nameController.text ,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text ,
                        cityId: id!,
                        pharmacyName: pharmacyNameController.text,
                        pharmacyAddress: pharmacyAddressController.text);

                  }

                } ,
                  text: local.Sign_up,
                  color: SilverChalice,

                ),
              ),
            )
                    )



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
