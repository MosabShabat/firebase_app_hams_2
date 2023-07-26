import 'dart:io';

import 'package:firebase_app_hams/controller/auth_getx_controller.dart';
import 'package:firebase_app_hams/fire_base/auth_firebase.dart';
import 'package:firebase_app_hams/fire_base/model/FirebaseResponse.dart';
import 'package:firebase_app_hams/fire_base/model/user.dart';
import 'package:firebase_app_hams/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utlis/helpers.dart';
import 'images_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  // late TextEditingController _fullNameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _birthDateTextController;
  late TextEditingController _birthTimeTextController;
  late TextEditingController _userNameController;
  String? _language;

  @override
  void initState() {
    super.initState();
    // _fullNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _birthDateTextController = TextEditingController();
    _birthTimeTextController = TextEditingController();
    _userNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _birthDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.privacy_tip),
      //   onPressed: () => Navigator.pushNamed(context, '/privacy_policy_screen'),
      // ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'REGISTER',
          style: GoogleFonts.actor(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // IconButton(
          //   onPressed: () => _customDialog(),
          //   icon: const Icon(Icons.info),
          // ),
          // IconButton(
          //   onPressed: () => _licensePage(),
          //   icon: const Icon(Icons.info),
          // ),
          IconButton(
            onPressed: () => _bottomSheet(),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New account...',
              style: GoogleFonts.actor(
                  fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1),
            ),
            Text(
              'Enter new account details',
              style: GoogleFonts.actor(
                fontWeight: FontWeight.w300,
                color: Colors.black45,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            // TextField(
            //   keyboardType: TextInputType.name,
            //   controller: _fullNameTextController,
            //   decoration: InputDecoration(
            //     hintText: 'Full name',
            //     prefixIcon: const Icon(Icons.person),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: const BorderSide(
            //         width: 1,
            //         color: Colors.grey,
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: const BorderSide(
            //         width: 1,
            //         color: Colors.blue,
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.name,
              controller: _emailTextController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordTextController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _birthDateTextController,
              keyboardType: TextInputType.datetime,
              readOnly: true,
              onTap: () {
                _pickDate();
              },
              decoration: InputDecoration(
                hintText: 'Birthdate',
                prefixIcon: const Icon(Icons.date_range),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _birthTimeTextController,
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: () {
                _pickTime();
              },
              decoration: InputDecoration(
                hintText: 'Birth time',
                prefixIcon: const Icon(Icons.schedule),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.name,
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: 'user Name',
                prefixIcon: const Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _performRegister(),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }

  void _licensePage() {
    showLicensePage(
        context: context,
        applicationName: 'AppName',
        applicationVersion: '1.2.3',
        applicationIcon: FlutterLogo(),
        applicationLegalese: 'Leagal Roles');
  }

  // void _sheetDialog() {
  //   show
  // }

  void _bottomSheet() async {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      clipBehavior: Clip.antiAlias,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 230,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change language',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Select suitable language',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                    ),
                    Divider(
                      color: Colors.black38,
                      thickness: 0.4,
                      height: 30,
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('English'),
                      value: 'en',
                      groupValue: _language,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() => _language = value);
                        }
                      },
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('Arabic'),
                      value: 'ar',
                      groupValue: _language,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() => _language = value);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        });
      },
    );
  }

  void _privacyPolicy() async {}

  void _pickTime() async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (timeOfDay != null) {
      _birthTimeTextController.text = timeOfDay.format(context);
    }
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      var format = DateFormat.yMd();
      var formattedDate = format.format(date);
      _birthDateTextController.text = formattedDate;
    }
    print(date);
    // DatePickerDialog(
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2000, 1, 1),
    //   lastDate: DateTime.now(),
    //   confirmText: 'Pick',
    //   cancelText: 'Cancel',
    //   helpText: 'Select birth date',
    // );
    // showDialog(
    //   barrierDismissible: false,
    //   context: context,
    //   builder: (context) {
    //     return DatePickerDialog(
    //       initialDate: DateTime.now(),
    //       firstDate: DateTime(2000, 1, 1),
    //       lastDate: DateTime.now(),
    //       confirmText: 'Pick',
    //       cancelText: 'Cancel',
    //       helpText: 'Select birth date',
    //     );
    //   },
    // );
  }

  void _customDialog() async {
    bool? hide = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              width: 2,
              color: Colors.blue,
            ),
          ),
          child: Container(
            height: 250,
            color: Colors.white,
            child: Column(
              children: [
                const Spacer(),
                const CircleAvatar(radius: 40),
                SizedBox(height: 15),
                Text(
                  'App Name',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Flutter Qatar',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black45,
                  ),
                ),
                Text(
                  'V 1.0.0',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.black26,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.blue.shade200,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text('HIDE'),
                )
              ],
            ),
          ),
        );
      },
    );

    print(hide ?? false);
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _userNameController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    FireBaseResponse response = await Get.find<AuthGetxController>().register(user: user);
    if (response.stauts) {
      Get.snackbar("title", response.message);
      Get.off(() => LoginScreen());
    } else {
      Get.snackbar("title", response.message);
    }

    // FirebaseResponse firebaseResponse = await FbAuthController().createAccount(
    //     email: _emailTextController.text,
    //     password: _passwordTextController.text);
    // if (firebaseResponse.success) {
    //   Navigator.pop(context);
    // }
    // showSnackBar(context, message: firebaseResponse.message);
  }

  User get user => User(
      email: _emailTextController.text,
      password: _passwordTextController.text,
      name: _userNameController.text,
      BD: _birthDateTextController.text,
      BTime: _birthTimeTextController.text
       );
}
