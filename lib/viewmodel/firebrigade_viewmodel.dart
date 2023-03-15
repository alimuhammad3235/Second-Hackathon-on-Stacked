import 'package:emerapp/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class FireBrigadeModel extends BaseViewModel {
  final userdata = locator<Spdata>();
  final _navigationService = locator<NavigationService>();

  String defaultname3 = "";
  String Dropdownvalue3 = "apple";
  List cases3 = [
    {"title": "Fire", "value": "1"},
    {"title": "Cylinder Blast", "value": "2"},
    {"title": "Short Circuit", "value": "3"},
  ];
  var newval = "User";
  changeon(newval1) {
    defaultname3 = newval1;
    rebuildUi();
  }

  makecallforFireBrigade() async {
    final Uri url = Uri(scheme: 'tel', path: "(021) 36649983");
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
