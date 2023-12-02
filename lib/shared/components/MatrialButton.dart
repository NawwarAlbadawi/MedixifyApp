
import 'package:flutter/material.dart';

class BuildMatrialBotton extends StatelessWidget {
  Function  () ? onPressed ;
  String ? text;
  Color ? color;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:onPressed,
      child: Text('$text',
        style: TextStyle(
            fontSize:20,
            color: color
        ),),

    );
  }

 BuildMatrialBotton({required this.onPressed,required this.text,
   this.color,
 });
}
