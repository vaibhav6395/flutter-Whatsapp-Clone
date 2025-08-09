import 'dart:convert';

class Usermodel {
  final String username;
  final String uid;
  final String profilepic;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupid;

  Usermodel({
    required this.username,
    required this.uid,
    required this.profilepic,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupid,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid': uid,
      'profilepic': profilepic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'groupid': groupid,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      username: map['username'] ?? '',
      uid: map['uid'] ?? '',
      profilepic: map['profilepic'] ?? '',
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      groupid: List<String>.from(map['groupid']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(json.decode(source));
}
