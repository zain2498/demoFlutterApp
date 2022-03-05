import 'package:demo2flutter/forgetPassword.dart';
import 'package:demo2flutter/register.dart';
import 'package:demo2flutter/whatsapp.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:demo2flutter/main.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => Mylogin(),
      'register': (context) => Myregister(),
      'forgetPassword': (context) => ForgetPassword(),
      'whatsapp' : (context) => MyWhatsappDM(),
    },
  ));
}
