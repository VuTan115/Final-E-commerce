import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_booking_application/app/pages/loading_page.dart';
import 'package:map_booking_application/app/pages/main_view.dart';
import 'package:map_booking_application/app/routes/app_route.dart';
import 'package:map_booking_application/app/themes/theme.dart';
import 'package:map_booking_application/domain/blocs/app/app_bloc.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';
import 'package:map_booking_application/domain/repositories/authentication_repository.dart';

class Application extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: _authenticationRepository,
          )
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<AppBloc>(
              lazy: true,
              create: (context) =>
                  AppBloc(authenticationRepository: _authenticationRepository)..add(AppStarted())),
          BlocProvider<AuthenticationBloc>(
            lazy: true,
            create: (context) =>
                AuthenticationBloc(authenticationRepository: _authenticationRepository)
                  ..add(AuthenticationStarted()),
          ),
        ], child: ApplicationView()));
  }
}

class ApplicationView extends StatefulWidget {
  const ApplicationView({Key? key}) : super(key: key);

  @override
  _ApplicationViewState createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: theme,
      builder: (context, child) {
        return BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is AppLoadInProgress) {
              _navigator.pushNamedAndRemoveUntil(AppRoute.loadingPage, (route) => false);
            }
            if (state is AppLoadFailure) {
              _navigator.pushNamedAndRemoveUntil(AppRoute.errorPage, (route) => false);
            }
            if (state is AppLoadSuccess) {
              _navigator.pushNamedAndRemoveUntil(
                AppRoute.loginPage,
                (route) => false,
                arguments: "",
              );
            }
          },
          child: child,
        );
      },
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
