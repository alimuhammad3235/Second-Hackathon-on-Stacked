import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:emerapp/utils/images.dart';
import 'package:emerapp/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        onViewModelReady: (viewModel) {
          Timer(const Duration(seconds: 8), () {
            viewModel.navigatetoRegister();
          });
        },
        viewModelBuilder: () => SplashViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 40),
                      child: Image.asset(ImagesConst.img2),
                    ),
                  const  Padding(
                      padding: const EdgeInsets.only(left: 100, top: 50),
                      child: Text(
                        "SQuiP",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Image.asset(ImagesConst.img3),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 180, top: 50),
                    child: Image.asset(ImagesConst.img1),
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(30.0),
                    child: Text(
                      "The Emergency \n Response App",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ));
  }
}
