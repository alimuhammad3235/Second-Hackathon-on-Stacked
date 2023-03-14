import 'dart:async';

import 'package:emerapp/viewmodel/splash_viewmodel.dart';
import 'package:emerapp/customwidgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/policerequest_viewmodel.dart';

class PoliceRequest extends StatelessWidget {
  PoliceRequest({super.key});
  String email = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliceRequestModel>.reactive(
      onViewModelReady: (viewModel) async {
        SharedPreferences sp1 = await SharedPreferences.getInstance();
        await showdetail();
        viewModel.rebuildUi();
        print("Email : ${sp1.getString("email1")}");
      },
      viewModelBuilder: () => PoliceRequestModel(),
      builder: (context, viewModel, child) => Scaffold(
          body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 127, 175, 252),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        email.toString(),
                        style: TextStyle(
                            fontFamily: 'Pappins',
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "Police Request",
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 35),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: viewModel.userdata.getpolicedata(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          var delid = snapshot.data!.docs[index].id;
                          var name = snapshot.data!.docs[index]["name"];
                          var charge = snapshot.data!.docs[index]["case"];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: Color.fromARGB(255, 32, 100, 209),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data.docs[index]["name"],
                                      style: TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 28,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      snapshot.data.docs[index]["case"],
                                      style: TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showSimpleModalDialog(context, name, charge);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 120, top: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Accept",
                                        style: TextStyle(
                                            fontFamily: 'Pacifico',
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(snapshot.data.docs[index]);
                                  viewModel.userdata.deleteRequest(delid);
                                  viewModel.rebuildUi();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 220, top: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Reject",
                                        style: TextStyle(
                                            fontFamily: 'Pacifico',
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ])),
    );
  }

  showdetail() async {
    SharedPreferences sp1 = await SharedPreferences.getInstance();
    email = sp1.getString('email1') ?? '';
    print(sp1.getString('email1'));
  }
}
