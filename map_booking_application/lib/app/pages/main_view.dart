import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_booking_application/app/pages/blank_page.dart';
import 'package:map_booking_application/app/routes/app_route.dart';
import 'package:map_booking_application/core/wemap%20template/full_map.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.blankPage, (route) => false);
    return Scaffold(body: FullMap());
  }
}
