import 'package:emerapp/app/app.router.dart';
import 'package:emerapp/services/show_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class AmbulanceRequestModel extends BaseViewModel {
  final userdata = locator<Spdata>();
  final _navigationService = locator<NavigationService>();

  deleteReq(id) {
    userdata.deleteAmbulRequest(id);
    rebuildUi();
  }

  logout() {
    userdata.signOut();
    _navigationService.navigateToLoginView();
    rebuildUi();
  }
}
