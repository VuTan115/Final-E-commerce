import 'package:flutter/material.dart';
import 'package:map_booking_application/app/utils/media.dart';

class QuBerLogo extends StatelessWidget {
  const QuBerLogo({Key? key, required size})
      : _size = size,
        super(key: key);
  final _size;
  @override
  Widget build(BuildContext context) {
    //getting screen size

    //calculating container width

    return Image.asset(
      "assets/logos/logo.png",
    );
  }
}
