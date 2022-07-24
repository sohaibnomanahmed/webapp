import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String imageUrl;
  final DateTime creationTime;
  /// initilized when data is fetched from firestore
  late bool isMe;

  // getters
  String get fullName => "$firstname $lastname";

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.imageUrl,
    required this.creationTime,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data == null) {
      throw 'Error creating User from null';
    }
    final String? firstname = data['firstname'];
    final String? lastname = data['lastname'];
    final String? email = data['email'];
    final String? imageUrl = data['imageUrl'];
    final DateTime? creationTime = data['creationTime'];

    if (
      firstname == null ||
      lastname == null ||
      email == null ||
      imageUrl == null ||
      creationTime == null
    ) {
      throw 'Error creating User from null values';
    }
    return User(
      id: doc.id,
      firstname: firstname,
      lastname: lastname,
      email: email,
      imageUrl: imageUrl,
      creationTime: creationTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'imageUrl': imageUrl,
      'creationTime': creationTime,
    };
  }
}
