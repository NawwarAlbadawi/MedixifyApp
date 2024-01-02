
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/blocs/app_cubit/common_states.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/moduels/change_password/change_password.dart';
import 'package:medixify/moduels/login/login_screen.dart';
import 'package:medixify/moduels/on_boarding/onboarding_screen.dart';
import 'package:medixify/moduels/profile/profiledetails.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/components/navigator_and_replace.dart';
import 'package:medixify/shared/components/navigator_and_replace.dart';
import 'package:medixify/shared/network/local/shared_preferebces.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommonCubit,CommonStates>(
        listener:(context,state){

        },
        builder: (context,state){

          return ConditionalBuilder(condition: MedixifyCubit.get(context).productsModel!=null,
              builder:(context)=>Container(
                color:basicColor,



                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 90
                  ),
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Colors.white,



                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,



                        children: [
                          SizedBox(height: 10,),
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/images/avatar.jpg'),

                          ),
                          SizedBox(height: 10,),
                          Text('${MedixifyCubit.get(context).profileModel!.data!.name!}',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color: basicColor
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5,),
                          Text('${MedixifyCubit.get(context).profileModel!.data!.email!}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color:  basicColor.withOpacity(0.5)
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 90,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40),

                            ),
                            child: InkWell(
                              onTap: (){
                                NavigateTo(
                                    context: context,
                                    widget: ProfileDetails()
                                );
                              },
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(Icons.person,
                                    color: basicColor,),
                                  Spacer(),
                                  Text(S.of(context).Account_Information,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: basicColor.withOpacity(0.9)
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: (){NavigateTo(
                                        context: context,
                                        widget: ProfileDetails()
                                    );},
                                    icon:Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,

                                    ),

                                    color: Colors.white,
                                    splashColor:SilverChalice,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40),

                            ),
                            child: InkWell(
                              onTap: (){
                                NavigateTo(
                                    context: context,
                                    widget: ChangePassword()
                                );
                              },
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.edit,
                                    color: basicColor,),
                                  Spacer(),
                                  Text(S.of(context).change_password,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: basicColor.withOpacity(0.9)
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: (){NavigateTo(
                                        context: context,
                                        widget: ProfileDetails()
                                    );},
                                    icon:Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,

                                    ),

                                    color: Colors.white,
                                    splashColor:SilverChalice,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color:  Colors.grey.withOpacity(0.4)
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 25,),
                                IconButton(onPressed: (){
                                  CommonCubit.get(context).changeLanguage();

                                },
                                    icon: Icon(Ionicons.language,
                                      color: basicColor,)),
                                SizedBox(width: 35,),


                                Text(
                                  CommonCubit.get(context).lang,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25,
                                      color: basicColor
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: SilverChalice
                            ),
                            child: BuildMatrialBotton(onPressed: (){
                              CachHelper.deleteSharedPreferences(key: 'token').then((value) {
                                CachHelper.deleteSharedPreferences(key: 'userId').then((value) {
                                  SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);

                                });

                              }
                              );

                            },
                              text: S.of(context).Logout,
                              color: basicColor,

                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              fallback: (context)=>Center(
                child: CircularProgressIndicator(),
              ));

        },);
  }
}
