import 'package:firebase_app_hams/controller/auth_getx_controller.dart';
import 'package:firebase_app_hams/fire_base/auth_firebase.dart';
import 'package:firebase_app_hams/screens/home_screen.dart';
import 'package:firebase_app_hams/screens/images_screen.dart';
import 'package:firebase_app_hams/screens/login_screen.dart';
import 'package:firebase_app_hams/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Get.put(AuthGetxController());
      // AuthFireBase().chechState();
      Get.off(()=>AuthFireBase().isLogin ?MainScreen():LoginScreen());
      },);
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
