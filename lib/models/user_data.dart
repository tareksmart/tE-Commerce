class UserData{
  final String uid;
  final String email;

  UserData({required this.uid,required this.email});

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