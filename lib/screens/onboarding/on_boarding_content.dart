import 'package:etnafes/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../util/constants/constraints.dart';

class Content extends StatelessWidget {
  final String? title;
  final String img;
  final String description;

  const Content(
      {Key? key, this.title, required this.img, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img,),
colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Constants.screenHeight * 0.13,
                    horizontal: Constants.screenWidth * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$title",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "AssistantLight",
                          color: ConstColors.bgColor,
                          fontSize: 30),
                    ),
                    Text(
                      "$description ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "SourceSansProExtra",
                          color: ConstColors.txtFormFieldColor,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
