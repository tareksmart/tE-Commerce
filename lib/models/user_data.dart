
import 'package:flutter/rendering.dart';

class UserData {
  final String uid;
  final String email;

  UserData({required this.uid,
   required this.email,}
    
  );

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map,String documentId) {
    return UserData(
      uid:documentId  ,
      email:map['email'] ?? '',
    );
  }


}
