import 'dart:convert';

class Prescrption {
  final String doctorName;
  final String name;
  final int phone;
  final String caseHistory;
  final String diagnosis;
  final String labTests;
  final String medicine;
  final String remarks;

  Prescrption({
    required this.doctorName,
    required this.name,
    required this.phone,
    required this.labTests,
    required this.medicine,
    required this.remarks,
    required this.caseHistory,
    required this.diagnosis,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctorName': doctorName,
      'name': name,
      'phone': phone,
      'caseHistory': caseHistory,
      'diagnosis': diagnosis,
      'labTests': labTests,
      'medicine': medicine,
      'remarks': remarks,
    };
  }

  factory Prescrption.fromMap(Map<String, dynamic> map) {
    return Prescrption(
      doctorName: map['doctorName'] as String,
      name: map['name'] as String,
      phone: map['phone'] as int,
      caseHistory: map['caseHistory'] as String,
      diagnosis: map['diagnosis'] as String,
      labTests: map['labTests'] as String,
      medicine: map['medicine'] as String,
      remarks: map['remarks'] as String,
      );
  }

  String toJson() => json.encode(toMap());

  factory Prescrption.fromJson(String source) =>
      Prescrption.fromMap(json.decode(source) as Map<String, dynamic>);
}
