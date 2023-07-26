import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  // FirebaseResponse generateResponse({required bool status}) {
  //   return FirebaseResponse(
  //       message:
  //       status ? 'Operation completed successfully' : 'Operation failed!',
  //       success: status);
  // }
}
