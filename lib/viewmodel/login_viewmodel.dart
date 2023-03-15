import 'package:emerapp/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final userdata = locator<Spdata>();

  navigatetoRegistration() {
    _navigationService.navigateToRegisterView();
  }

  bool isHidden = true;
  showpassword() {
    isHidden = !isHidden;
    rebuildUi();
  }

  navigatetoUser() {
    _navigationService.navigateToUserView();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
      );
       Fluttertoast.showToast(
            msg: "Successfully LogIn", backgroundColor: Colors.indigoAccent);
      _navigationService.navigateToUserView();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "Password is too Weak", backgroundColor: Colors.indigoAccent);

        rebuildUi();
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "email-already-in-use", backgroundColor: Colors.indigoAccent);

        rebuildUi();
        print('The account already exists for that email.');
      } else if (e.code == 'email or password are wrong') {
        Fluttertoast.showToast(
            msg: "email or password are wrong",
            backgroundColor: Colors.indigoAccent);
        rebuildUi();
        print('Email and Password are Wrong');
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "email or password are wrong",
          backgroundColor: Colors.indigoAccent);
      print(e);
      rebuildUi();
    }
  }

  getdata(texttt) {
    userdata.storedata(texttt);
    rebuildUi();
  }
}
