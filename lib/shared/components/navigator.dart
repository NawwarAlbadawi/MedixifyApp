import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildNavigator {
  late Widget widget;
  late BuildContext context;

  BuildNavigator({required this.widget,required this.context}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
}