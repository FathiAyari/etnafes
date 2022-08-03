import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/constants/constraints.dart';


class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController passwordController;
  const PasswordField({Key? key, required this.label, required this.passwordController}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.01, horizontal: Constants.screenWidth * 0.01),
      child:        TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return " this field is required";
          }
        },

        controller: widget.passwordController,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: widget.label,
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
            suffixIcon: IconButton(
              icon: obscureText
                  ? Icon(
                Icons.remove_red_eye,
                color: Color(0xffa0c4f6),
              )
                  : Icon(
                Icons.visibility_off,
                color: Colors.black12,
              ),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
