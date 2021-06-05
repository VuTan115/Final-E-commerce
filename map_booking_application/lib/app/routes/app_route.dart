import 'package:flutter/material.dart';
import 'package:map_booking_application/app/pages/blank_page.dart';
import 'package:map_booking_application/app/pages/components/authenticate/authenticate.dart';
import 'package:map_booking_application/app/pages/loading_page.dart';
import 'package:map_booking_application/app/pages/login_page.dart';
import 'package:map_booking_application/app/pages/main_view.dart';
import 'package:map_booking_application/app/pages/welcom_page.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse) {
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  static const String authenticate = '/authenticate';
  static const String blankPage = '/';
  static const String loadingPage = '/loading';
  static const String welcomePage = '/welcome';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String homePage = '/home';
  static const String errorPage = '/error';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authenticate:
        return PageViewTransition(builder: (_) => Authenticate());
      case loadingPage:
        return PageViewTransition(builder: (_) => LoadingPage());
      case welcomePage:
        return PageViewTransition(builder: (_) => WelcomPage());
      case blankPage:
        return PageViewTransition(builder: (_) => BlankPage());
      case homePage:
        return PageViewTransition(builder: (_) => HomePage());
      case loginPage:
        return PageViewTransition(builder: (_) => LoginPage());
      default:
        return PageViewTransition(builder: (_) => LoadingPage());
    }
  }
}
