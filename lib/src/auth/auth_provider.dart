import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';


import '../user/models/user.dart';
import '../user/user_service.dart';
import 'auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService;
  final UserService userService;

  AuthProvider({
    required this.authService,
    required this.userService
  });

  var _isLoading = false;
  final String _defaultMessage =
      'Something went wrong, please try again later!';

  /// getters
  bool get isLoading => _isLoading;

  /// tries to sign a user in using
  /// if successfull returns true, else store error message in [_errorMessage] and return false
  Future<Tuple2<bool, String>> signIn(
      {required String email, required String password}) async {
    var errorMessage = '';
    _isLoading = true;
    notifyListeners();
    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'All fields are required and can\'t be empty';
      _isLoading = false;
      notifyListeners();
      return Tuple2(false, errorMessage);
    }
    try {
      final userCredentials =
          await authService.signIn(email: email.trim(), password: password);
      // final user = userCredentials.user!;
      // send email varification TODO add bakc in prod
      // if (!user.emailVerified) {
      //   await _authService.signOut();
      //   _isLoading = false;
      //   notifyListeners();
      //   return const Tuple2(false, 'Email is not verified');
      // }
    } on firebase_auth.FirebaseAuthException catch (error) {
      _isLoading = false;
      notifyListeners();
      return Tuple2(false, error.message ?? _defaultMessage);
    }
    _isLoading = false;
    notifyListeners();
    return const Tuple2(true, 'Successfully signed in');
  }

  /// tries to reset a users password
  /// if successfull returns true, else store error message in [_errorMessage] and return false
  Future<Tuple2<bool, String>> resetPassword(String email) async {
    _isLoading = true;
    notifyListeners();
    try {
      await authService.resetPassword(email);
    } on firebase_auth.FirebaseAuthException catch (error) {
      _isLoading = false;
      notifyListeners();
      return Tuple2(false, error.message ?? _defaultMessage);
    }
    _isLoading = false;
    notifyListeners();
    return const Tuple2(true, 'Reset password email sent');
  }

  /// tries to create a user
  /// test input fields are not empty and creates a user and his profile
  /// if successfull returns true if an error occurs, return false and error message
  Future<Tuple2<bool, String>> createUser({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    var errorMessage = '';
    _isLoading = true;
    notifyListeners();
    if (firstname.isEmpty ||
        lastname.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      errorMessage = 'All fields are required and can\'t be empty';
      _isLoading = false;
      notifyListeners();
      return Tuple2(false, errorMessage);
    }
    try {
      // create user
      final userCredentials = await authService.createUser(
          email: email.trim(), password: password);
      final firebaseUser = userCredentials.user!;
      final time = firebaseUser.metadata.creationTime;
      if (time == null) {
        errorMessage = 'Failed trying to create the user, time not accesable';
        return Tuple2(false, errorMessage);
      }
      // create profile data in firestore
      final user = User(
        id: firebaseUser.uid,
        creationTime: time,
        firstname: firstname,
        lastname: lastname,
        email: email,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/campus-2fda4.appspot.com/o/default_profile.png?alt=media&token=069ba66d-11ff-42ca-bbd8-5621f37c95d1',
      );

      // This is saved multiple places, since others infromation is needed then we need it stored
      // Many times own image and name is needed, not having to load that information goes faster as its included with the current user
      await firebaseUser.updateDisplayName(user.fullName);
      await firebaseUser.updatePhotoURL(user.imageUrl);
      await userService.setUser(uid: user.id, user: user);

      // send email varification
      if (!firebaseUser.emailVerified) {
        await firebaseUser.sendEmailVerification();
        // log user out so he/she can log inn
        await authService.signOut();
      }
    } on firebase_auth.FirebaseAuthException catch (error) {
      errorMessage = error.message ?? _defaultMessage;
      _isLoading = false;
      notifyListeners();
      return Tuple2(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return const Tuple2(
        true, 'Verification email sent, please check your inbox!');
  }
}
