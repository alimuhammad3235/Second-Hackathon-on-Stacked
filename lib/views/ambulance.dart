import 'dart:async';

import 'package:emerapp/viewmodel/police_viewmodel.dart';
import 'package:emerapp/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/ambulance_viewmodel.dart';

class AmbulanceView extends StatelessWidget {
  const AmbulanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AmbulanceViewModel>.reactive(
      onViewModelReady: (viewModel) {},
      viewModelBuilder: () => AmbulanceViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: ListView(children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    color: Color(0xff8dfee8),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewModel.navigatetoUser();
                        },
                        child: const Padding(
                          padding: const EdgeInsets.only(top: 20, left: 25),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back_sharp,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Ambulance Helpline",
                          style: TextStyle(fontFamily: 'Pacifico', fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: viewModel.userdata.ambnamecontoller,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      hintStyle: TextStyle(
                          fontFamily: ' Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xff8dfee8),
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InputDecorator(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff8dfee8),
                      ),
                    )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isDense: true,
                          isExpanded: true,
                          menuMaxHeight: 250,
                          value: viewModel.defaultname2,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Select Case",
                                style: TextStyle(
                                    fontFamily: ' Poppins',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                              value: "",
                            ),
                            ...viewModel.cases2
                                .map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e['title'],
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ),
                                value: e['title'],
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            viewModel.changeon(value);
                            print("Selected Case: $value");
                            viewModel.userdata.defaultnm2 = value!;
                            // viewModel. = value;
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color(0xff8dfee8),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      "Ambulance Helpline",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    subtitle: Text(
                      "Dial: 1122",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        viewModel.makecallforambulance();
                      },
                      child: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    viewModel.userdata.ambaddData();
                    viewModel.userdata.ambnamecontoller.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Color(0xff8dfee8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Send Request",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
