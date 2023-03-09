import 'dart:async';

import 'package:emerapp/viewmode/police_viewmodel.dart';
import 'package:emerapp/viewmode/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PoliceView extends StatelessWidget {
  const PoliceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliceViewModel>.reactive(
      onViewModelReady: (viewModel) {},
      viewModelBuilder: () => PoliceViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        
      ),
    );
  }
}
