import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerapp/viewmodel/register_viewmodel.dart';
import 'package:emerapp/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        onViewModelReady: (viewModel) {},
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              body: ListView(children: [
                Column(
                  children: [
                  const  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "Registration",
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 50,
                            color: Color.fromARGB(255, 32, 100, 209)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 60, left: 20, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: viewModel.emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration:const InputDecoration(
                          hintText: 'Type Email',
                          hintStyle: TextStyle(
                              fontFamily: 'Poppins', color: Colors.black87),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blueGrey,
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueGrey),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length == 0) {
                            return "Email cannot be empty";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: viewModel.passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: viewModel.isHidden,
                        decoration: InputDecoration(
                          hintText: 'Type Password',
                          hintStyle:const TextStyle(
                              fontFamily: 'Poppins', color: Colors.black87),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                viewModel.showpassword();
                              },
                              child: Icon(
                                viewModel.isHidden == false
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.blueGrey,
                              )),
                          border:const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blueGrey),
                          ),
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("please enter valid password min. 6 character");
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: TextFormField(
                        controller: viewModel.confirmpasscontroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: viewModel.isHidden,
                        decoration: InputDecoration(
                          hintText: 'Re-Type Password',
                          hintStyle:const TextStyle(
                              fontFamily: 'Poppins', color: Colors.black87),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                viewModel.showpassword();
                              },
                              child: Icon(
                                viewModel.isHidden == false
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.blueGrey,
                              )),
                          border: const OutlineInputBorder(
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
                          borderSide:
                            const  BorderSide(width: 1, color: Colors.blueGrey),
                        )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isDense: true,
                              isExpanded: true,
                              menuMaxHeight: 250,
                              value: viewModel.defaultname,
                              items:  [
                                DropdownMenuItem(
                                  child: Text(
                                    "Select Type",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black87),
                                  ),
                                  value: "",
                                ),
                                ...viewModel.itemm
                                    .map<DropdownMenuItem<String>>((e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e['title'],
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                    value: e['value'],
                                  );
                                }).toList(),
                              ],
                              onChanged: (value) {
                                viewModel.changeui(value);
                                print("Selected Type: $value");
                                viewModel.userdata.valueee = value;
                              }),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences sp1 =
                            await SharedPreferences.getInstance();
                        sp1.setString("email1", viewModel.emailcontroller.text);
                        print("Set Email:${sp1.getString("email1")}");
                        print(sp1.get("email1"));
                        viewModel.signup(context);
                        viewModel.emailcontroller.clear();
                        viewModel.passwordcontroller.clear();
                        viewModel.confirmpasscontroller.clear();
                        // viewModel.userdata.shareddata();
                        // print(viewModel.userdata.shareddata());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.073,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 32, 100, 209),
                              borderRadius: BorderRadius.circular(10)),
                          child:const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account? ",
                          style:
                              TextStyle(fontFamily: 'Pacifico', fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.navigatetoLogin();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 24,
                              color: Color.fromARGB(255, 32, 100, 209),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ]),
            ));
  }
}
