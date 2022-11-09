// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:webapp/src/auth/auth_provider.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:webapp/src/auth/auth_service.dart';

void main() {
  // Sign in.
  final user = MockUser(
    uid: 'someuid',
    email: 'bob@somedomain.com',
    displayName: 'Bob',
  );
  final auth = MockFirebaseAuth(mockUser: user);
  final authService = AuthService(auth);

  test('User should be able to login with correct credentials', () async {
    final res = await authService.signIn(email: 'bob@somedomain.com', password: "123");
    expect(res.item1 , true);
  });

  test('User should not be able to login with wrong credentials', () async {
    final res = await authService.signIn(email: 'rob@somedomain.com', password: "123");
    expect(res.item1 , false);
  });

  // test('User should be able to create a new account with neccecary and allowed credentials', () {
  //   counter.increment();
  //   expect(counter.value, 1);
  // });

  // test('User should be able to reset password if an account exists', () {
  //   counter.increment();
  //   expect(counter.value, 1);
  // });

  // test('User should be able to logout if logedin', () {
  //   counter.increment();
  //   expect(counter.value, 1);
  // });
}
