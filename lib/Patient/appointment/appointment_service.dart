import 'package:animalicu/Patient/appointment/appointment_model.dart';
import 'package:animalicu/auth/service/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../global_constant.dart';
class AppointmentService {
  void patientAppointment({
    required BuildContext context,
    required String name,
    required String code,
    required int phone,
    required String age,
    required String gender,
    required String problemCategory,
    required String chiefCompliant,
    required String duration,
    required String history,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Appointment appointment = Appointment(
          name: name,
          code: code,
          age: age,
          phone: phone,
          chiefCompliant: chiefCompliant,
          history: history,
          duration: duration,
          gender: gender,
          problemCategory: problemCategory);

      http.Response res = await http.post(
        Uri.parse('$uri/api/dash/appointment'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: appointment.toJson(),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Appointment Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
