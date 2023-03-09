import 'package:emerapp/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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
      _navigationService.navigateToUserView();
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
