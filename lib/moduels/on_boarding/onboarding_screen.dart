



import 'package:flutter/material.dart';
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
        children: [
          Container(
            width: double.infinity,
           // height:400,
            //color: Colors.black,
            child: Image(
              image: AssetImage('assets/images/new.png',),
              fit: BoxFit.cover,
            ),
          ),
         Spacer(),
          Text(S.of(context).On_boarding_title,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: basicColor,


          ),
          )       ,

                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Container(
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: basicColor,
                       borderRadius: BorderRadius.circular(20)
                     ),
                     child:  BuildMatrialBotton(
                       text: S.of(context).start_Now,
                       color:SilverChalice,
                       onPressed: (){
                         CachHelper.setSharedPreferences(key: 'OnBoarding',value:true).then((value) {
                      NavigatorAndReplace(context: context,widget: LoginScreen());});
                                  }



                   ),
                 ),
                 )





        ],
      ),
      //backgroundColor: Colors.lightBlue,




    );

  }
}
