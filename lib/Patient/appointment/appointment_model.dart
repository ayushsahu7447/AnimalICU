// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';
import '../../models/prescription.dart';


class Appointment {
  final String name;
  final int phone;
  final String age;
  final String gender;
  final String problemCategory;
  final String chiefCompliant;
  final String duration;
  final String history;
  final String code;
  final List<Prescrption>? Prescription;

  Appointment({
    required this.code,
    required this.name,
    required this.age,
    required this.phone,
    required this.chiefCompliant,
    required this.history,
    required this.duration,
    required this.gender,
    required this.problemCategory,
    this.Prescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'phone': phone,
      'age': age,
      'gender': gender,
      'problemCategory': problemCategory,
      'chiefCompliant': chiefCompliant,
      'duration': duration,
      'history': history,
      'Prescription': Prescription,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      name: map['name'] as String,
      code: map['code'] as String,
      phone: map['phone'] as int,
      age: map['age'] as String,
      gender: map['gender'] as String,
      problemCategory: map['problemCategory'] as String,
      chiefCompliant: map['chiefCompliant'] as String,
      duration: map['duration'] as String,
      history: map['history'] as String,
      Prescription: map['Prescription'] != null
          ? List<Prescrption>.from(
        (map['Prescription'] as List<int>).map<Prescrption?>(
              (x) => Prescrption.fromMap(x as Map<String, dynamic>),
        ),
      )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source) as Map<String, dynamic>);
}
