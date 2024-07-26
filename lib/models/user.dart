import 'dart:convert';

class User {
  final String? id;
  final String name;
  final String email;
  final String password;
  final int phone;
  final String? address;
  final String dob;
  final String gender;
  final String qualification;
  final String occupation;
  final String type;
  final String token;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.address,
    required this.dob,
    required this.gender,
    required this.qualification,
    required this.occupation,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'dob': dob,
      'gender': gender,
      'qualification': qualification,
      'occupation': occupation,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? 0,
      address: map['address'] ?? '',
      dob: map['dob'] ?? '',
      gender: map['gender'] ?? '',
      qualification: map['qualification'] ?? '',
      occupation: map['occupation'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    int? phone,
    String? address,
    String? dob,
    String? gender,
    String? qualification,
    String? occupation,
    String? type,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      qualification: qualification ?? this.qualification,
      occupation: occupation ?? this.occupation,
      type: type ?? this.type,
      token: token ?? this.token,
    );
  }
}
