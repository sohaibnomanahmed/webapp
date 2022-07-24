
import 'package:cloud_firestore/cloud_firestore.dart';

import '../db/firestore_collection.dart';
import 'models/user.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String userCollection = FirestoreCollections.usersCollection;

  /// set user data
  Future<void> setUser({required String uid, required User user}) {
    return _firestore.collection(userCollection).doc(uid).set(user.toMap());
  }

  /// get user data
  Future<User> getUser(String uid) async {
    final user = await _firestore.collection(userCollection).doc(uid).get();
    return User.fromFirestore(user);
  }

  /// get user stream
  Stream<User> fetchUser(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .snapshots()
        .map((user) => User.fromFirestore(user));
  }

  /// get the id for the service account
  Future<String> getAdminId() async {
    final admins = await _firestore.collection('admin').get();
    return admins.docs.first.id;
  }
}
