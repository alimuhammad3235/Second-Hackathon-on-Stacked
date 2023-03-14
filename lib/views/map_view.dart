import 'dart:async';

import 'package:emerapp/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:stacked/stacked.dart';

import '../viewmodel/map_viewmodel.dart';

class MapView extends StatelessWidget {
  MapView({super.key});
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
        onViewModelReady: (viewModel) {
          // viewModel.disposeUi();
        },
        viewModelBuilder: () => MapViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Text(
                  "Google Maps",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                actions: [
                  if (viewModel.origin != null)
                    TextButton(
                      onPressed: () {
                        viewModel.checkin();
                        // viewModel.rebuildUi();
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(fontWeight: FontWeight.w600)),
                      child: Text("ORIGIN"),
                    ),
                  if (viewModel.destination != null)
                    TextButton(
                      onPressed: () {
                        viewModel.checkyu();
                        // viewModel.rebuildUi();
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      child: Text("DEST"),
                    ),
                ],
              ),
              body: GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: viewModel.initialCameraPosition,
                onMapCreated: (controller) =>
                    viewModel.googleMapController = controller,
                markers: {
                  if (viewModel.origin != null) viewModel.origin!,
                  if (viewModel.destination != null) viewModel.destination!,
                },
                onLongPress: viewModel.addMarker,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                onPressed: () => viewModel.googleMapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                      viewModel.initialCameraPosition),
                ),
                child: const Icon(Icons.center_focus_strong),
              ),
            ));
  }
}
