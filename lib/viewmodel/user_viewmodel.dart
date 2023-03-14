import 'package:emerapp/app/app.locator.dart';
import 'package:emerapp/app/app.router.dart';
import 'package:emerapp/services/show_pass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserViewModel extends BaseViewModel {
  final userdata = locator<Spdata>();
  final _navigationService = locator<NavigationService>();

  String email = "";
  getdata(datta) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('Email') ?? '';
  }

  cleardata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    rebuildUi();
  }

  logout() {
    userdata.signOut();
    _navigationService.navigateToLoginView();
    rebuildUi();
  }

  navigateToPolice() {
    _navigationService.navigateToPoliceView();
  }

  navigateToAmbulance() {
    _navigationService.navigateToAmbulanceView();
  }

  navigatieToFire() {
    _navigationService.navigateToFireBrigade();
  }

  navigateToMap() {
    _navigationService.navigateToMapView();
  }
}
