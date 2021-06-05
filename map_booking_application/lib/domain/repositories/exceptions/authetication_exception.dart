abstract class AuthenticationException {}

// Thrown if during the sign up process if a failure occurs.
class SignUpFailure extends AuthenticationException implements Exception {}

// Thrown during the login process if a failure occurs.
class LogInFailure extends AuthenticationException implements Exception {}

// Thrown during the logout process if a failure occurs.
class LogOutFailure extends AuthenticationException implements Exception {}

// Thrown during the get user process if failure occurs.
class GetUserFailure extends AuthenticationException implements Exception {}

/// Thrown if during the sign up process if a failure occurs.

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure extends AuthenticationException implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure extends AuthenticationException implements Exception {}

/// Thrown during the logout process if a failure occurs.

