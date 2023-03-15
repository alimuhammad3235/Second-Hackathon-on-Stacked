import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerapp/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class PoliceRequestModel extends BaseViewModel {
  final userdata = locator<Spdata>();
  final _navigationService = locator<NavigationService>();


  deleteReq(id) {
    userdata.deleteRequest(id);
    rebuildUi();
  }
logout() {
    userdata.signOut();
    _navigationService.navigateToLoginView();
    rebuildUi();
  }
  
}
