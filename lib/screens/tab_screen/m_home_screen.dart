import 'package:firebase_app_hams/controller/fav_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api.dart';
import '../../fire_base/auth_firebase.dart';
import '../../fire_base/store_firebase.dart';
import '../../post.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    //  getData();
    super.initState();
  }

  // getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   List<Post> p = await StoreFirebase().getAllPost();
  //   Get.find<FavGetxController>().getFav(p);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Post>>(
      future: ApiController().getAllPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return GetBuilder<FavGetxController>(
            builder:(controller)=> ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Post p = snapshot.data![index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Card(
                          color: Colors.blue[100],
                          child: ListTile(
                            onTap: () {
                              //Get.to(() => PostDetails(p.id!));
                            },
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  '${p.id}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            title: Text(
                              p.title!,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            subtitle: Text(
                              p.body!,
                              maxLines: 3,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: IconButton(onPressed: () async {
                              if(controller.putFavIcon(p)){
                                bool b = await StoreFirebase().deleteFavourate(AuthFireBase().instance.currentUser!.uid, p);
                                if(b){
                                  controller.delete(p);
                                }
                              }else {
                                bool b = await StoreFirebase().putFavourate(AuthFireBase().instance.currentUser!.uid, p);
                                if(b){
                                  controller.addToFav(p);
                                }
                              }

                        }, icon: controller.putFavIcon(p)?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border)))
                      ],
                    ),
                  );
                }),
          );
        } else {
          return Center(
            child: Text("no data found"),
          );
        }
      },
    );
  }
}
