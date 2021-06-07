import 'package:flutter/material.dart';
import 'package:map_booking_application/app/utils/media.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final dynamic validator;
  final bool obscureText;
  final String textFeildTitle;
  final Icon? textFeildIcon;
  const MyTextField(
      {Key? key,
      this.controller,
      required this.textFeildTitle,
      this.textFeildIcon,
      required this.obscureText,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFeildTitle,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 65.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autocorrect: true,
              validator: validator,
              cursorColor: Colors.white10,
              obscureText: obscureText,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 12.0),
                prefixIcon: textFeildIcon ?? null,
                hintText: 'Enter your $textFeildTitle',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
