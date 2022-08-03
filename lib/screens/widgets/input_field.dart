import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/constants/constraints.dart';

Widget inputField(String label, TextInputType textInputType, TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.01, horizontal: Constants.screenWidth * 0.01),
    child:TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return " cet camp est obligatoire";
        } else if (label == "Email") {
          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
          if (!emailValid) {
            return " Format incorrecte d'email ";
          }
        }
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}
