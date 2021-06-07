import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_booking_application/app/routes/app_route.dart';
import 'package:map_booking_application/app/utils/media.dart';
import 'package:map_booking_application/app/widgets/background.dart';
import 'package:map_booking_application/app/widgets/my_form_feild.dart';
import 'package:map_booking_application/app/widgets/quber_logo.dart';
import 'package:map_booking_application/app/widgets/social_button.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
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
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      MyForm(
                        formKey: _formKey,
                      ),
                      // buildForgotPasswordBtn,
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () => print('Forgot Password Button Pressed'),
                          padding: EdgeInsets.only(right: 0.0),
                          child: Text(
                            'Forgot Password?',
                            style: kLabelStyle,
                          ),
                        ),
                      ),
                      // buildRememberMeCheckbox
                      Container(
                        height: 20.0,
                        child: Row(
                          children: <Widget>[
                            Theme(
                              data: ThemeData(unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: _rememberMe,
                                checkColor: Colors.green,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                      ),

                      // buildLoginBtn
                      LogInButton(
                        buttonTitle: "LOGIN",
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
                      SignUpButton()
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

  void _logInButton() async {}

  bool isValidated() {
    return _formKey.currentState!.validate();
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.registerPage, (route) => false);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
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

class LogInButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  const LogInButton({Key? key, required this.onPressed, required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: onPressed,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
