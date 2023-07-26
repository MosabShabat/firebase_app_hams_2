import 'package:flutter/material.dart';

import '../../fire_base/store_firebase.dart';

class FriendPage extends StatefulWidget {
  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StoreFirebase().getAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].email),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    color: Colors.orange),
              );
            },
          );
        } else {
          return Text("no data found");
        }
      },
    );
  }
}
