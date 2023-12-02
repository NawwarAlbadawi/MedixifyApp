

import 'package:flutter/material.dart';

class NavigatorAndReplace {
 late Widget  widget;
 late BuildContext context;
   NavigatorAndReplace({required this.widget,required this.context})
   {
     Navigator.pushAndRemoveUntil(context,
       MaterialPageRoute(builder: (context)=>widget),

             (Route<dynamic>route)
         {
           return false;
         }) ;
   }


}
