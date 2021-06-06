import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_booking_application/app/pages/components/login/login_screen.dart';
import 'package:map_booking_application/app/routes/app_route.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';

import '../widgets/my_text_feild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
