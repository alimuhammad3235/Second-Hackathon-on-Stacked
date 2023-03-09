import 'package:emerapp/viewmode/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onViewModelReady: (viewModel) {},
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 60,
                          color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60, left: 20, right: 20, bottom: 20),
                    child: TextFormField(
                      controller: viewModel.emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Type Email',
                        hintStyle: TextStyle(fontFamily: 'Pacifico'),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: viewModel.passcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: viewModel.isHidden,
                      decoration: InputDecoration(
                        hintText: 'Type Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Pacifico',
                        ),
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
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.login(context);
                      viewModel.emailcontroller.clear();
                      viewModel.passcontroller.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.073,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Login",
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
                        "Don't have an Account? ",
                        style: TextStyle(fontFamily: 'Pacifico', fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          viewModel.navigatetoRegistration();
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 24,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
