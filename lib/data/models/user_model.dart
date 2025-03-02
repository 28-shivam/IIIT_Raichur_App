import 'dart:convert';

class User {
  String id;
  String fullName;
  String mobile;
  DateTime dob;
  String email;
  String profileImage;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.dob,
    required this.email,
    this.profileImage = '',
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      fullName: json['fullName'],
      mobile: json['mobile'],
      dob: DateTime.parse(json['dob']),
      email: json['email'],
      profileImage: json['profileImage'] ?? '',
      gender: json['gender'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'mobile': mobile,
      'dob': dob.toIso8601String(),
      'email': email,
      'profileImage': profileImage,
      'gender': gender,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'User {id: $id, fullName: $fullName, mobile: $mobile, email: $email, gender: $gender}';
  }

  bool isAdult() {
    final today = DateTime.now();
    final age = today.year - dob.year;
    return age >= 18;
  }

  void updateProfile({
    String? newFullName,
    String? newMobile,
    String? newProfileImage,
    String? newGender,
  }) {
    if (newFullName != null) fullName = newFullName;
    if (newMobile != null) mobile = newMobile;
    if (newProfileImage != null) profileImage = newProfileImage;
    if (newGender != null) gender = newGender;
    updatedAt = DateTime.now();
  }
}