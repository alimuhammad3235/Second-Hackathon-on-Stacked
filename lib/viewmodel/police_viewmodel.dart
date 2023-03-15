import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerapp/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class PoliceViewModel extends BaseViewModel {
  final userdata = locator<Spdata>();
  final _navigationService = locator<NavigationService>();

  String defaultname1 = "";
  String defaultnm1 = "";
  String Dropdownvalue1 = "apple";
  List cases = [
    {"title": "Fight/Fire", "value": "1"},
    {"title": "Robbery", "value": "2"},
    {"title": "Harassment", "value": "3"},
  ];
  var newval = "User";
  changescene(newval1) {
    defaultname1 = newval1;
    rebuildUi();
  }

  makecallforPolice() async {
    final Uri url = Uri(scheme: 'tel', path: "125");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      rebuildUi();
    } else {
      print('cannot launch this url');
    }
  }

  navigatetoUser() {
    _navigationService.navigateToUserView();
  }
}
