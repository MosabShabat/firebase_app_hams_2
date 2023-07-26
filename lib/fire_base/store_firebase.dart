import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_hams/fire_base/auth_firebase.dart';
import 'package:firebase_app_hams/fire_base/model/user.dart';

import '../post.dart';
import 'model/FirebaseResponse.dart';

class StoreFirebase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<FireBaseResponse> addUserData(User user) async {
    try {
      // await firebaseFirestore.collection("Users").add(user.toJson());
      await firebaseFirestore
          .collection("Users")
          .doc(user.id)
          .set(user.toJson());
      return FireBaseResponse(stauts: true, message: "verify your account");
    } catch (e) {
      return FireBaseResponse(stauts: false, message: e.toString());
    }
  }

  getUserData(id) {
    firebaseFirestore.collection("Users").doc(id).get().then((value) {});
    // firebaseFirestore
    //     .collection("Users")
    //     .where("id", isEqualTo: id)
    //     .get()
    //     .then((value) {
    //
    // });
  }

  Future<List<User>> getAllUsers() async {
    List<User> list = [];
    return await firebaseFirestore
        .collection("Users")
        .where('id', isNotEqualTo: AuthFireBase().instance.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        User u = User.fromJson(element.data());
        list.add(u);
      });
      return list;
    });
  }

  updateUser(user) {
    firebaseFirestore.collection("Users").doc(user.id).update(user.tojson());
  }

  Future<bool> putFavourate(id, Post post) async {
    post.userId1 = id;
    return await firebaseFirestore
        .collection("Favourate")
         .doc(post.id.toString())
        .set(post.toJson())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
  Future<bool> deleteFavourate(id, Post post) async {
    post.userId1 = id;
    return await firebaseFirestore
        .collection("Favourate")
        .doc(post.id.toString())
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<List<Post>> getAllPost() async {
    List<Post> list = [];
    return await firebaseFirestore
        .collection("Favourate")
        .where('userId1', isEqualTo: AuthFireBase().instance.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Post u = Post.fromJson(element.data());
        list.add(u);
      });
      return list;
    });
  }

}
