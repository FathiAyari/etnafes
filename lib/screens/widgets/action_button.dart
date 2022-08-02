import 'package:etnafes/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../util/constants/constraints.dart';

Padding buildActionButton(String label, VoidCallback press) {
  return Padding(
    padding: EdgeInsets.only(
        top: Constants.screenHeight * 0.03, right: Constants.screenWidth * 0.03, left: Constants.screenWidth * 0.03),
    child: Container(
      width: double.infinity,
      height: Constants.screenHeight * 0.06,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: ConstColors.blueCustomColor),
          onPressed: press,
          child: Text("$label")),
    ),
  );
}
