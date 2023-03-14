import 'package:emerapp/app/app.locator.dart';
import 'package:emerapp/app/app.router.dart';
import 'package:emerapp/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigatetoRegister() {
    _navigationService..navigateToLoginView();
  }
List colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

 TextStyle colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);
}
