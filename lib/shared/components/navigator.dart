import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigateTo {
  late Widget widget;
  late BuildContext context;

  NavigateTo({required this.widget,required this.context}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
}