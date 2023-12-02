



import 'package:flutter/material.dart';
import 'package:medixify/shared/style/colors.dart';

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
              image: AssetImage('assets/images/Download_Isometric_Pharmacy_and_Medication_Production_Concept_for_free-removebg.png',),
              fit: BoxFit.cover,
            ),
          ),
         Spacer(),
          Text('Welcome To Our App',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: PoliceBlue,


          ),
          )       ,

                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Container(
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: YankeesBlue,
                       borderRadius: BorderRadius.circular(20)
                     ),
                     child: new BuildMatrialBotton(
                       text: 'Start Now',
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
