import 'dart:async';

import 'package:etnafes/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../util/constants/constraints.dart';
import '../onboarding/on_boarding_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplashScreen> {
  var seen = GetStorage().read("seen");
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () => Get.to( OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColors.bgColor,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          Image.asset(
                "assets/images/logo.png",
                height: Constants.screenHeight * 0.3,
                width: Constants.screenWidth * 0.7,
              ),

              Lottie.asset(
                "assets/images/lf30_editor_9bclacla.json",
                height: Constants.screenWidth * 0.1,
              )
            ],
          ),
        ));
  }
}
