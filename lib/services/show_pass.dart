import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerapp/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class Spdata {
  final _navigationService = locator<NavigationService>();

  TextEditingController emailcontroller = TextEditingController();

  storedata(String text) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("Email", text);
    sp.setBool("isLogin", true);
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
        msg: "SignOut Successfully", backgroundColor: Colors.indigoAccent);
  }

  String defaultnm1 = "";
  TextEditingController namecontoller = TextEditingController();
  addData() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("policecase");
    products
        .add({"name": namecontoller.text, "case": defaultnm1.toString()})
        .then(
          (value) => Fluttertoast.showToast(
            backgroundColor: Colors.indigoAccent,
            msg: "Request Submitted Successfully",
          ),
        )
        .catchError((e) => print(e));
  }

  deleteRequest(idd) {
    late CollectionReference ref =
        FirebaseFirestore.instance.collection("policecase");
    ref.doc(idd).delete();
    Fluttertoast.showToast(
        msg: "Request Deleted Successfully",
        backgroundColor: Colors.indigoAccent);
  }

  deleteAmbulRequest(id1) {
    late CollectionReference ref =
        FirebaseFirestore.instance.collection("ambulancecase");
    ref.doc(id1).delete();
    Fluttertoast.showToast(
        msg: "Request Deleted Successfully",
        backgroundColor: Colors.indigoAccent);
  }

  deletefireRequest(id1) {
    late CollectionReference ref =
        FirebaseFirestore.instance.collection("firebrigadecase");
    ref.doc(id1).delete();
    Fluttertoast.showToast(
        msg: "Request Deleted Successfully",
        backgroundColor: Colors.indigoAccent);
  }

  String defaultnm2 = "";
  TextEditingController ambnamecontoller = TextEditingController();
  ambaddData() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("ambulancecase");
    products
        .add({"name": ambnamecontoller.text, "case": defaultnm2.toString()})
        .then((value) => Fluttertoast.showToast(
            msg: "Request Added Successfullty",
            backgroundColor: Colors.indigoAccent))
        .catchError((e) => print(e));
  }
  

  String defaultnm3 = "";
  TextEditingController firenamecontoller = TextEditingController();
  fireaddData() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("firebrigadecase");
    products
        .add({"name": firenamecontoller.text, "case": defaultnm3.toString()})
        .then((value) => Fluttertoast.showToast(
            msg: "Request Added Successfully",
            backgroundColor: Colors.indigoAccent))
        .catchError((e) => print(e));
  }

  var valueee;
  shareddata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("Email", emailcontroller.text);
    sp.setBool("isLogin", true);
    sp.setString('userType', valueee);
    print(sp.getString('Email'));
    // print(newval);
    if (sp.getString('userType') == '1') {
      _navigationService.navigateToPoliceRequest();
    } else if (sp.getString('userType') == '2') {
      _navigationService.navigateToFireRequest();
    } else if (sp.getString('userType') == '3') {
      _navigationService.navigateToAmbulanceRequest();
    } else if (sp.getString('userType') == '4') {
      _navigationService.navigateToUserView();
    } else {
      _navigationService.navigateToUserView();
    }
  }

  CollectionReference policecase =
      FirebaseFirestore.instance.collection("policecase");

  getpolicedata() async {
    return policecase.get();
  }

  CollectionReference ambulance =
      FirebaseFirestore.instance.collection("ambulancecase");
  getAmbulancedata() async {
    return ambulance.get();
  }

  CollectionReference firebri =
      FirebaseFirestore.instance.collection("firebrigadecase");
  getfireRequest() async {
    return firebri.get();
  }

  // deleteFromPoliceR() {
  //   CollectionReference policecase =
  //     FirebaseFirestore.instance.collection("policecase");
  //   policecase.Collecton("names").doc("case").delete().then(
  //         (doc) => print("Document deleted"),
  //         onError: (e) => print("Error updating document $e"),
  //       );
  // }
}
