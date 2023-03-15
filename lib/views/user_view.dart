import 'dart:async';

import 'package:emerapp/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class UserView extends StatelessWidget {
  UserView({super.key});
  String email = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.reactive(
        onViewModelReady: (viewModel) async {
          await showdt();
          viewModel.rebuildUi();
        },
        viewModelBuilder: () => UserViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  viewModel.navigateToMap();
                },
                child: Icon(
                  Icons.location_on,
                  color: Colors.black87,
                  size: 40,
                ),
                backgroundColor: Colors.white,
              ),
              body: SafeArea(
                child: ListView(children: [
                  Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 10, top: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.menu,
                                    size: 30,
                                  ),
                                  Text(
                                    email.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.logout();
                                    },
                                    child: const Icon(
                                      Icons.logout,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                        )),
                    const Padding(
                      padding: const EdgeInsets.only(top: 38),
                      child: Text(
                        "Following Provided Services",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.deepPurpleAccent,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 70, bottom: 20),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffdae8ff),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Text(
                                            "Police Helpline",
                                            style: TextStyle(
                                                fontFamily: 'Pacifico',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 22),
                                          ),
                                        ),
                                        const Text(
                                          "Dial: 125",
                                          style: TextStyle(
                                              fontFamily: 'Pacifico',
                                              fontSize: 24),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 90),
                                          child: GestureDetector(
                                            onTap: () {
                                              viewModel.navigateToPolice();
                                            },
                                            child: const Icon(
                                              Icons.forward_outlined,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 70, bottom: 20),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff8dfee8),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Text(
                                            "Ambulane Helpline",
                                            style: TextStyle(
                                                fontFamily: 'Pacifico',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                        ),
                                        const Text(
                                          "Dial: 1122",
                                          style: TextStyle(
                                              fontFamily: 'Pacifico',
                                              fontSize: 24),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 90),
                                          child: GestureDetector(
                                            onTap: () {
                                              viewModel.navigateToAmbulance();
                                            },
                                            child: const Icon(
                                              Icons.forward_outlined,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xffd4f3f9),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Fire Helpline",
                                          style: TextStyle(
                                              fontFamily: 'Pacifico',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          "Dial: (021)3664",
                                          style: TextStyle(
                                              fontFamily: 'Pacifico',
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 90),
                                        child: GestureDetector(
                                          onTap: () {
                                            viewModel.navigatieToFire();
                                          },
                                          child: const Icon(
                                            Icons.forward_outlined,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ]),
              ),
            ));
  }

  showdt() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('Email') ?? '';
    print(sp.getString('Email'));
  }
}
