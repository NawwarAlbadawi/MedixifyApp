
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/login_regiser_cubit/login_register_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/custom_toast.dart';
import 'package:medixify/shared/components/form_field.dart';

import '../../blocs/app_cubit/common_cubit.dart';
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
      (listener: (context,state){
        if(state is GetProfileSuccessesState)
          {
            CustomToast(
              message: 'Changed',
              color: SilverChalice,
              context: context,
            );
          }
    },
      builder: (context,state){
        emailController.text=cubit.profileModel!.data!.email!;
        nameController.text=cubit.profileModel!.data!.name!;
        phoneController.text=cubit.profileModel!.data!.phone!;
        pharmacyNameController.text=cubit.profileModel!.data!.pharmacyName!;
        cityController.text=cubit.profileModel!.data!.en_city!;
        pharmacyAddressController.text=cubit.profileModel!.data!.pharmacyAddress!;
        var formkey=GlobalKey<FormState>();
        int ? id;

        return Form(
          key: formkey,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
               local.Profile_Details ,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: basicColor
                ),
              ),
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
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
                    BuildFormField(
                      controller:emailController ,
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
                          prefixIcon: PopupMenuButton(

                            icon: Icon(Icons.location_city_outlined),

                            itemBuilder: (context)=>List.generate(
                                LoginAndRegisterCubit.get(context).cityModel!.cityData!.length,
                                    (index)=>PopupMenuItem(child: Text('${CommonCubit.get(context).isarabic?
                                    LoginAndRegisterCubit.get(context).arabicCity[index]: LoginAndRegisterCubit.get(context).englishCity[index]}',
                                  selectionColor: Colors.red,),
                                  value: LoginAndRegisterCubit.get(context).cityModel!.cityData![index] ,)
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: basicColor
                      ),
                      child: BuildMatrialBotton(
                        onPressed: (){

                          cubit.updateProfileData(
                            name:nameController.text,
                            email: emailController.text,
                            pharmacyAddress: pharmacyAddressController.text,
                            pharmacyName: pharmacyNameController.text,
                            city:id

                          );
                        },
                          text: local.save,
                      color: SilverChalice,

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
          ),
        );

      },
    );
  }
}
