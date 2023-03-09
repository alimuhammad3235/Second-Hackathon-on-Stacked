import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerapp/app/app.locator.dart';
import 'package:emerapp/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/show_pass.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatetoLogin() {
    _navigationService.navigateToLoginView();
  }

  bool isHidden = true;
  showpassword() {
    isHidden = !isHidden;
    rebuildUi();
  }

  String defaultname = "";
  String Dropdownvalue = "apple";
  List itemm = [
    {"title": "Police", "value": "1"},
    {"title": "Fire-Brigade", "value": "2"},
    {"title": "Ambulance", "value": "3"},
    {"title": "User", "value": "4"},
  ];
  var newval = "User";
  changeui(newval) {
    defaultname = newval;
    rebuildUi();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // TextEditingController confirmpasscontroller = TextEditingController();
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      _navigationService.navigateToLoginView();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
