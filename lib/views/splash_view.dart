import 'dart:async';

import 'package:emerapp/viewmode/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onViewModelReady: (viewModel) {
        Timer(Duration(seconds: 10), () {
          viewModel.navigatetoRegister();
        });
      },
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
            child: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg'),
        )),
      ),
    );
  }
}
