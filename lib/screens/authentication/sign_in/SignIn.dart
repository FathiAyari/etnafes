import 'dart:io';

import 'package:etnafes/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import '../../../util/constants/constraints.dart';
import '../../onboarding/on_boarding_controller.dart';
import '../../widgets/action_button.dart';
import '../../widgets/alert_widgets.dart';
import '../../widgets/input_field.dart';
import '../../widgets/password_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  OnBoardingController controller = OnBoardingController();
  Future<bool> avoidReturnButton() async {
    NAlertDialog(
      title: Column(
        children: [
          Image.asset("assets/images/dexclamation.png", height: Constants.screenHeight * 0.06, color: Colors.red),
          Text(
            "Vous etes sur de quiter?",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "NunitoBold",
            ),
          ),
        ],
      ),
      actions: [
        Negative(),
        Positive(() {
          exit(0);
        })
      ],
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: avoidReturnButton,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: ConstColors.bgColor,
        resizeToAvoidBottomInset: false,
        body: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    height: Constants.screenHeight * 0.95,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset("assets/images/logo.png", height: Constants.screenHeight * 0.2),
                              inputField("Email", TextInputType.emailAddress, emailController),
                              PasswordField(label: "Mot de passe", passwordController: passwordController),
                              Container(
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: Constants.screenHeight * 0.02,
                                          top: Constants.screenHeight * 0.02,
                                          right: Constants.screenWidth * 0.04),
                                      child: TextButton(
                                          onPressed: () {
                                            //  Get.to(ForgotPassword());
                                          },
                                          child: Text(
                                            "Mot de passe oubliée ?",
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                            ),
                                          )))),
                              loading
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(),
                                    )
                                  : buildActionButton("S'authentifier", () {
                                      if (_formKey.currentState!.validate()) {
                                        /*  setState(() {
                                        loading = true;
                                      });
                                      AuthServices().signIn(emailController.text, passwordController.text).then((value) async {
                                        if (value) {
                                          final FirebaseAuth auth = await FirebaseAuth.instance;
                                          final User? user = await auth.currentUser;
                                          final uid = user!.uid;
                                          var UserData = await FirebaseFirestore.instance.collection('users').doc(uid).get();
                                          Cusers currentUser = Cusers.fromJson(UserData.data() as Map<String, dynamic>);
                                          controller.saveUser(currentUser);
                                          Get.toNamed("/home");
                                        } else {
                                          setState(() {
                                            loading = false;
                                          });
                                          Fluttertoast.showToast(
                                              msg: "Les données ne sont pas correctes",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      });*/
                                      }
                                    }),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                  child: Text("Besoin d'un nouveau compte?",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: ConstColors.blueCustomColor,
                                        fontSize: 14,
                                      )),
                                  onPressed: () {},
                                ))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      )),
    );
  }
}
