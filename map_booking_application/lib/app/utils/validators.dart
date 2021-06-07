class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static bool isValidEmail({required String email}) {
    // return _emailRegExp.hasMatch(email);
    return true;
  }

  static bool isValidPassword({required String password}) {
    // return _passwordRegExp.hasMatch(password);
    return true;
  }
}
