import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_booking_application/app/pages/main_view.dart';
import 'package:map_booking_application/app/routes/app_route.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.homePage, (route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.loginPage, (route) => false);
        }
      },
      child: HomePage(),
    );
  }
}
