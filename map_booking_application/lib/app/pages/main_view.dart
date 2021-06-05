import 'package:flutter/material.dart';
import 'package:map_booking_application/app/pages/blank_page.dart';
import 'package:map_booking_application/app/routes/app_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.blankPage, (route) => false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("click"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => BlankPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
