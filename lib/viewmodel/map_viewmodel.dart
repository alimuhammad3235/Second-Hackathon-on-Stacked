import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  final initialCameraPosition = CameraPosition(
      target: LatLng(
        24.8607,
        67.0011,
      ),
      zoom: 14.5);
  Marker? origin;
  Marker? destination;
  GoogleMapController? googleMapController;

  checkin() {
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: origin!.position, zoom: 14.5, tilt: 50.0)));
    rebuildUi();
  }

  checkyu() {
    rebuildUi();
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: destination!.position,
          zoom: 20.5,
          tilt: 50.0,
        ),
      ),
    );
    rebuildUi();
  }

  addMarker(LatLng pos) async {
    if (origin == null || (origin != null && destination != null)) {
      origin = Marker(
        markerId: const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'Origin'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
      rebuildUi();
      destination = null;
    } else {
      destination = Marker(
        markerId: const MarkerId('destination'),
        infoWindow: const InfoWindow(title: 'Destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
      );
      rebuildUi();
      // Get directions
    }
  }
}
