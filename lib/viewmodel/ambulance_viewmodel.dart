import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class AmbulanceViewModel extends BaseViewModel {
  final userdata = locator<Spdata>();

  String defaultname2 = "";
  String Dropdownvalue2 = "apple";
  List cases2 = [
    {"title": "Medical Emergency", "value": "1"},
    {"title": "Fire", "value": "2"},
    {"title": "Accident", "value": "3"},
  ];
  var newval = "User";
  changeon(newval1) {
    defaultname2 = newval1;
    rebuildUi();
  }

  makecallforambulance() async {
    final Uri url = Uri(scheme: 'tel', path: "1122");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      rebuildUi();
    } else {
      print('cannot launch this url');
    }
  }
}
