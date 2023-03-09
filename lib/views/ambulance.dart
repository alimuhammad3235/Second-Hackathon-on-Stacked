import 'dart:async';

import 'package:emerapp/viewmode/police_viewmodel.dart';
import 'package:emerapp/viewmode/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmode/ambulance_viewmodel.dart';

class AmbulanceView extends StatelessWidget {
  const AmbulanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AmbulanceViewModel>.reactive(
      onViewModelReady: (viewModel) {},
      viewModelBuilder: () => AmbulanceViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        
      ),
    );
  }
}
