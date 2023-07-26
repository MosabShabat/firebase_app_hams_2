import 'dart:async';

import 'package:firebase_app_hams/fire_base/model/FirebaseResponse.dart';
import 'package:firebase_app_hams/fire_base/model/user.dart' as modelUser;
import 'package:firebase_app_hams/fire_base/store_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart' ;

class AuthFireBase {
  // bool isLogin = false;
  FirebaseAuth instance = FirebaseAuth.instance;

  Future<FireBaseResponse> login({email, password}) async {
    return await instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value){
          if(value.user!.emailVerified){
            return FireBaseResponse(stauts: true,message: "Login Sueccfully");

          }else {
            value.user!.sendEmailVerification();
            return FireBaseResponse(stauts: false,message: "Validate your account");
          }


    }).onError((error, stackTrace) {
      return FireBaseResponse(stauts: false,message: error.toString());

    });
    // if(user != null){
    //
    // }else {
    //
    // }
  }

  Future<FireBaseResponse> register({required modelUser.User myUser})  {
    return instance.createUserWithEmailAndPassword(email: myUser.email, password: myUser.password)
        .then((value){
          value.user!.sendEmailVerification();
          myUser.id = value.user!.uid;
          return StoreFirebase().addUserData(myUser);
    }).onError((error, stackTrace) {
      return FireBaseResponse(stauts: false,message: error.toString());


    });
  }

  forgetPassword({email}){
    instance.sendPasswordResetEmail(email: email);
  }

  bool get isLogin =>instance.currentUser != null;

  // StreamSubscription chechState(){
  //   return instance.authStateChanges().listen((event) {
  //     if (event == null) {
  //          isLogin = true;
  //       } else {
  //         isLogin = false;
  //     }
  //   });
  // }

  logout(){
    instance.signOut();
  }

}
