import 'package:emerapp/services/show_pass.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';

class AmbulanceRequestModel extends BaseViewModel {
  final userdata = locator<Spdata>();

  deleteReq(id) {
    userdata.deleteAmbulRequest(id);
    rebuildUi();
  }

}
