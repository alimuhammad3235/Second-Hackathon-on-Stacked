import 'dart:async';

import 'package:emerapp/viewmodel/police_viewmodel.dart';
import 'package:emerapp/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/ambulance_viewmodel.dart';
import '../viewmodel/firebrigade_viewmodel.dart';

class FireBrigade extends StatelessWidget {
  const FireBrigade({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FireBrigadeModel>.reactive(
      onViewModelReady: (viewModel) {},
      viewModelBuilder: () => FireBrigadeModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: ListView(children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 160, 235, 250),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: Center(
                    child: Text(
                      "FireBrigade Helpline",
                      style: TextStyle(fontFamily: 'Pacifico', fontSize: 35),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: viewModel.userdata.firenamecontoller,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.blueGrey),
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
                      borderSide: BorderSide(width: 1, color: Colors.blueGrey),
                    )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isDense: true,
                          isExpanded: true,
                          menuMaxHeight: 250,
                          value: viewModel.defaultname3,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Select Case",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87),
                              ),
                              value: "",
                            ),
                            ...viewModel.cases3
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
                            viewModel.userdata.defaultnm3 = value!;
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      "FireBrigade Helpline",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    subtitle: Text(
                      "Dial: (021) 36649983",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.black87),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        viewModel.makecallforFireBrigade();
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
                    viewModel.userdata.fireaddData();
                    viewModel.userdata.firenamecontoller.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 160, 235, 250),
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
