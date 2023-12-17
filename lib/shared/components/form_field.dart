
import 'package:flutter/material.dart';
import 'package:medixify/shared/style/colors.dart';

class BuildFormField extends StatelessWidget {
   BuildFormField({
     super.key,
     required  this.controller,
     this.suffix,
     required this.inputType,
     required this.validator,
     this.onChanged,
     this.onSubmit,
     this.prefix,
     required this.label,
     this.needscure=false,
     this.suffixBotton,
     this.radius=20,
     this.color,




                });
  String ?label;
  TextEditingController ? controller;
  IconData  ?suffix;
  IconData  ?prefix;
  TextInputType ?inputType;
  String ? Function ( String ?)? validator ;
  Function (String value)? onChanged ;
  Function (String value)? onSubmit ;
  Function ()? suffixBotton ;
  Function ()?prefixBotton;
   bool ?  needscure;
   double radius;
   Color ? color;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: basicColor
            )
                    ),

          labelText: label,

          prefixIcon:Icon(prefix),
          suffixIcon:IconButton(onPressed:suffixBotton, icon: Icon(suffix)),
        ),
        obscureText:(needscure!),
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        validator: validator,
        scrollPhysics: BouncingScrollPhysics(),
        cursorColor: ViridianGreen,
        textInputAction: TextInputAction.next,



      ),
    );
  }
}
