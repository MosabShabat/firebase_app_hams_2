import 'package:firebase_app_hams/fire_base/model/user.dart';
import 'package:get/get.dart';

import '../fire_base/auth_firebase.dart';

class AuthGetxController extends GetxController {

  login({email,password}) async {
    return await AuthFireBase().login(
        email: email,
        password: password);
}

  register({required User user}) async {
    return await AuthFireBase().register(myUser: user);
  }

}