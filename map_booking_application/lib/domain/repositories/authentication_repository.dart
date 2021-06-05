import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:map_booking_application/domain/models/user_model.dart';
import 'package:map_booking_application/domain/repositories/exceptions/authetication_exception.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn? _googleSignIn;

  AuthenticationRepository({
    GoogleSignIn? googleSignIn,
    FirebaseAuth? firebaseAuth,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw LogInFailure();
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn!.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  Future<UserCredential> signUp({required String email, required String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw SignUpFailure();
    }
  }

  Future<List<void>> logOut() async {
    try {
      return Future.wait([_firebaseAuth.signOut()]);
    } on Exception {
      throw LogOutFailure();
    }
  }

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? UserModel.empty : UserModel.fromUser(firebaseUser);
      return user;
    });
  }

  UserModel get currentUser {
    return UserModel.fromUser(_firebaseAuth.currentUser);
  }

  bool get isNotEmpty => this != UserModel.empty;

  bool get isEmpty => this == UserModel.empty;
}
