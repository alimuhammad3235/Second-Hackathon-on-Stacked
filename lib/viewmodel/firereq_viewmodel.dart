import 'package:emerapp/services/show_pass.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';

class FireRequestModel extends BaseViewModel {
  final userdata = locator<Spdata>();
  deleteReqfire(id) {
    userdata.deletefireRequest(id);
    rebuildUi();
  }
}
