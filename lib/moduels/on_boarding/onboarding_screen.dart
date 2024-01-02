



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medixify/moduels/register/register.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';
import '../../shared/components/MatrialButton.dart';
import '../../shared/components/navigator_and_replace.dart';
import '../../shared/network/local/shared_preferebces.dart';
import '../login/login_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
           // height:400,
            //color: Colors.black,
            child: Image(
              image: AssetImage('assets/images/Onboarding.png',),
              fit: BoxFit.cover,
            ),
          ),
         Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  S.of(context).onboarding,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: basicColor,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )       ,
             SizedBox(height: 10,),

                 Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 10
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: basicColor,
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,10),
                    color: SilverChalice,
                    blurRadius: 10
                  )
                ]
              ),
              child:  BuildMatrialBotton(
                  text: S.of(context).sign_in,
                  color:SilverChalice,
                  onPressed: (){
                    CachHelper.setSharedPreferences(key: 'OnBoarding',value:true).then((value) {
                      NavigatorAndReplace(context: context,widget: LoginScreen());});
                  }



              ),
            ),
          ),
                //SizedBox(height: 20,),
                 Padding(
                   padding: const EdgeInsets.only(
                     left: 20,
                     right: 20,
                     bottom: 20,
                     top: 10
                   ),
                   child: Container(
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: basicColor.withOpacity(0.8),
                       
                       borderRadius: BorderRadius.circular(20)
                     ),
                     child:  BuildMatrialBotton(
                       text: S.of(context).createAccount,
                       color:SilverChalice,
                       onPressed: (){
                         CachHelper.setSharedPreferences(key: 'OnBoarding',value:true).then((value) {
                      NavigateTo(context: context,widget: RegisterScreen());
                         });
                                  }



                   ),
                 ),
                 ),





        ],
      ),
      //backgroundColor: Colors.lightBlue,




    );

  }
}
