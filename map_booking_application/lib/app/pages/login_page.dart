import 'package:flutter/material.dart';
import 'package:map_booking_application/domain/utils/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            //title
            Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyForm()
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  MyForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  icon: Icon(Icons.person),
                  fillColor: Colors.amber,
                  focusColor: Colors.transparent,
                ),
                validator: (value) =>
                    Validators.isValidEmail(email: value.toString()) ? "" : "Invalid Username",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.security),
                  fillColor: Colors.amber,
                  focusColor: Colors.transparent,
                ),
                validator: (value) => Validators.isValidPassword(password: value.toString())
                    ? ""
                    : "Invalid Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState!;
                  if (form.validate()) {
                    form.save();
                  } else {
                    print(form);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const AlertDialog(
                        actions: [
                          Icon(
                            Icons.warning,
                            color: Colors.red,
                          )
                        ],
                        title: Text('Login Failed!'),
                      ),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                width: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_balance_wallet_sharp),
                    Text("Login with Google"),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
