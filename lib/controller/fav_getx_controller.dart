import 'package:get/get.dart';

import '../fire_base/store_firebase.dart';
import '../post.dart';

class FavGetxController extends GetxController {
  List<Post> p = <Post>[];
  addToFav(post){
    p.add(post);
    update();
  }
  getFav() async {
    List<Post> list = await StoreFirebase().getAllPost();
    p = list;
  }
  putFavIcon(Post post){
    if(p.where((element) => element.id == post.id).isNotEmpty){
      return p.where((element) => element.id == post.id).first.id == post.id;
    }
    return false;
  }
  delete(post){
    p.removeWhere((element) {
      return element.id == post.id;
    },);
    update();
  }

  @override
  void onInit() {
    getFav();
    super.onInit();
  }
}
