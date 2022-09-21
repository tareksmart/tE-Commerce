
import 'package:flutter/rendering.dart';

class UserData {
  final String uid;
  final String email;

<<<<<<< HEAD
  UserData({required this.uid,
    required this.email,});
  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'email': this.email,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'] as String,
      email: map['email'] as String,
    );
  }

=======
  UserData({required this.uid,required this.email});
>>>>>>> b987ae40f76bda1bc333b1af4829635d9f6f32c2

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'email': this.email,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid']?? '',
      email: map['email'] ?? '',
    );
  }
}