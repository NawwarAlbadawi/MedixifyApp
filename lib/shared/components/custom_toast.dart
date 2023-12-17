
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast  {
  CustomToast({
  required this.message,
  required this.context,
  required this.color})
  {
    toastification.show(
        context: context,
        autoCloseDuration: const Duration(seconds: 5),
        title: message,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: BorderRadius.circular(30),
        closeOnClick: true,
        pauseOnHover: true,
        showProgressBar: false

    );
  }
  String message;
  BuildContext context;
  Color color;


  }

