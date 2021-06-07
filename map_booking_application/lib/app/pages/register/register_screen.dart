import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_booking_application/app/pages/login/login_screen.dart';
import 'package:map_booking_application/app/routes/app_route.dart';
import 'package:map_booking_application/app/utils/media.dart';
import 'package:map_booking_application/app/widgets/background.dart';
import 'package:map_booking_application/app/widgets/my_form_feild.dart';
import 'package:map_booking_application/app/widgets/my_text_feild.dart';
import 'package:map_booking_application/app/widgets/social_button.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:map_booking_application/app/widgets/social_button.dart';
import 'package:map_booking_application/app/utils/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              //background
              BackGround(),
              // ui
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterLogo(
                        size: 70,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
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
                            SizedBox(
                              height: 30.0,
                            ),
                            MyTextField(
                              textFeildTitle: "Confirm",
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
                      ),

                      // buildLoginBtn
                      LogInButton(
                        buttonTitle: "Sign Up",
                        onPressed: () {
                          if (isValidated()) {
                            print("validated");
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil(AppRoute.authenticate, (route) => false);
                            context.read<AuthenticationBloc>().add(AuthenticationLoggedIn());
                          }
                        },
                      ),
                      // buildSignInWithText
                      SignInWith(),
                      // buildSocialBtnRow
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SocialButton(
                                onTap: _signInWithGoogle, imageUrl: 'assets/images/google.png'),
                            SocialButton(
                                onTap: _signInWithFacebook, imageUrl: 'assets/images/facebook.png'),
                          ],
                        ),
                      ),
                      // buildSignupBtn
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(AppRoute.loginPage, (route) => false);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an Account? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins'),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signInWithGoogle() async {
    print("Sign in with Google Button Pressed!");
  }

  void _signInWithFacebook() async {
    print("Sign in with Facebook Button Pressed!");
  }

  bool isValidated() {
    return _formKey.currentState!.validate();
  }
}

class SignInWith extends StatelessWidget {
  const SignInWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }
}
