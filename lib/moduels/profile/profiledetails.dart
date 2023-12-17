
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/form_field.dart';

import '../../generated/l10n.dart';
import '../../shared/style/colors.dart';

class ProfileDetails extends StatelessWidget {
   ProfileDetails({super.key});
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var pharmacyNameController=TextEditingController();
  var pharmacyAddressController=TextEditingController();
  var cityController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit=MedixifyCubit.get(context);
    var local=S.of(context);

    return BlocConsumer<MedixifyCubit,MedixifyStates>
      (listener: (context,state){},
      builder: (context,state){
        print(cubit.profileModel!.data!.email);
        nameController.text=cubit.profileModel!.data!.name!;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile Details',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: basicColor
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(


                left: 20,
                right: 20,
                top: 50

              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  BuildFormField(
                    controller:nameController ,
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
                    radius: 30,

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
                    prefix: Icons.email,
                    radius: 30,
                  ),
                  SizedBox(height: 15,),
                  BuildFormField(controller:phoneController ,
                    inputType: TextInputType.phone,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Phone mustn\'t be empty';
                      }
                      else if(value.length!=10)
                      {
                        return 'Please enter correct number';
                      }
                      return null;
                    },
                    label: local.Register_Phone_number,
                    prefix: Icons.phone_android,
                    radius: 30,
                  ),
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
                    prefix: Icons.lock,
                    radius: 30,
                  ),
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
                    prefix: Icons.person,
                    onChanged: (value){
                    },
                    radius: 30,
                  ),
                  SizedBox(height: 15,),
                  TextFormField(

                    decoration: InputDecoration(

                        border: OutlineInputBorder(


                          borderRadius: BorderRadius.circular(30),



                        ),

                        labelText: local.Register_city,


                    ),
                    controller: cityController,
                    keyboardType: TextInputType.none,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'City  mustn\'t be empty';
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
                  BuildFormField(
                    controller:pharmacyAddressController ,
                    inputType: TextInputType.streetAddress,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Pharmacy address mustn\'t be empty';
                      }
                      return null;
                    }, label: local.Register_pharmacy_address,
                    prefix: Icons.location_on,
                    radius: 30,




                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: basicColor
                    ),
                    child: BuildMatrialBotton(onPressed: (){},
                        text: 'Save',
                    color: Colors.white,

                    ),
                  )




                ],
              )
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Column(
              //
              //
              //       children: [
              //         Container(
              //           height: 60,
              //           width: 80,
              //
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: SilverChalice
              //           ),
              //
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Name',
              //                 style: TextStyle(
              //                     color: basicColor,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold
              //
              //                 ),
              //
              //
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox( height: 20,),
              //         Container(
              //           height: 60,
              //           width: 80,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: SilverChalice
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Email',
              //                 style: TextStyle(
              //                     color: basicColor,
              //                     fontSize: 20,
              //                   fontWeight: FontWeight.bold
              //                 ),
              //                 maxLines: 3,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox( height: 20,),
              //         Container(
              //           height: 60,
              //           width: 80,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: SilverChalice
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Phone',
              //                 style: TextStyle(
              //                     color: basicColor,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold
              //                 ),
              //                 maxLines: 3,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox( height: 20,),
              //         Container(
              //           height: 60,
              //           width: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: SilverChalice
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.end,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('Pharmacy name',
              //                 style: TextStyle(
              //                     color: basicColor,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold
              //                 ),
              //                 maxLines: 2,
              //                 textAlign: TextAlign.center,
              //
              //
              //
              //
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox( height: 20,),
              //         Container(
              //           height: 60,
              //           width: 80,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: SilverChalice
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text('City',
              //                 style: TextStyle(
              //                     color: basicColor,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold
              //                 ),
              //                 maxLines: 3,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox( height: 20,),
              //         Container(
              //           height: 60,
              //           width: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: SilverChalice
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             //crossAxisAlignment: CrossAxisAlignment.end,
              //             children: [
              //               Text('Pharmacy address',
              //                 style: TextStyle(
              //                     color: basicColor,
              //                     fontSize: 20,
              //                     fontWeight: FontWeight.bold
              //                 ),
              //                 maxLines: 2,
              //                 textAlign: TextAlign.center,
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ],
              //           ),
              //         ),
              //
              //       ],
              //     ),
              //     Spacer(),
              //     Column(
              //       children: [
              //         Container(
              //           height: 60,
              //           width: 250,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: basicColor
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //
              //
              //               Text('${ cubit.profileModel!.data!.name}',
              //
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.white,
              //                     fontSize: 20
              //                 ),)
              //
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 20,),
              //         Container(
              //           height: 60,
              //           width: 250,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: basicColor
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //
              //
              //
              //               Text('${cubit.profileModel!.data!.email}',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.white,
              //                 fontSize: 20
              //               ),),
              //
              //
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 20,),
              //         Container(
              //           height: 60,
              //           width: 250,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: basicColor
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //
              //
              //
              //               Text('${cubit.profileModel!.data!.phone}',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.white,
              //                     fontSize: 20
              //                 ),),
              //
              //
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 20,),
              //         Container(
              //           height: 60,
              //           width: 250,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: basicColor
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //
              //
              //
              //               Text('${cubit.profileModel!.data!.pharmacyName}',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.white,
              //                     fontSize: 20
              //                 ),),
              //
              //
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 20,),
              //         Container(
              //           height: 60,
              //           width: 250,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: basicColor
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //
              //
              //
              //               Text('${cubit.profileModel!.data!.city}',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.white,
              //                     fontSize: 20
              //                 ),),
              //
              //
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 20,),
              //         Container(
              //           height: 60,
              //           width: 250,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: basicColor
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //
              //
              //
              //               Text('${cubit.profileModel!.data!.pharmacyAddress}',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     color: Colors.white,
              //                     fontSize: 20
              //                 ),),
              //
              //
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //
              //
              //   ],
              // ),
            ),
          ),
        );

      },
    );
  }
}
