import 'package:flutter/material.dart';
import 'package:map_booking_application/app/widgets/my_text_feild.dart';
import 'package:map_booking_application/app/utils/validators.dart';

class MyForm extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const MyForm({this.formKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField(
            textFeildTitle: "Email",
            obscureText: false,
            textFeildIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            validator: (value) {
              if (Validators.isValidEmail(email: value.toString())) {
                return null;
              } else {
                return "Invalid email";
              }
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          MyTextField(
            textFeildTitle: "Password",
            obscureText: true,
            textFeildIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            validator: (value) {
              if (Validators.isValidPassword(password: value.toString())) {
                return null;
              } else {
                return "Invalid password";
              }
            },
          ),
        ],
      ),
    );
  }
}
