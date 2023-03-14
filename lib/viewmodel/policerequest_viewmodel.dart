import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../services/show_pass.dart';

class PoliceRequestModel extends BaseViewModel {
  final userdata = locator<Spdata>();

  deleteReq(id) {
    userdata.deleteRequest(id);
    rebuildUi();
  }
}
