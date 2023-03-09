import 'dart:async';

import 'package:emerapp/viewmode/splash_viewmodel.dart';
import 'package:emerapp/viewmode/user_viewmodel.dart';
import 'package:emerapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.reactive(
        onViewModelReady: (viewModel) {},
        viewModelBuilder: () => UserViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              body: SafeArea(
                  child: Column(
                children: [
                  dpcust("POLICE"),
                ],
              )),
            ));
  }
}
