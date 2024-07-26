import 'package:animalicu/models/prescription.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../auth/service/user_provider.dart';
import '../../global_constant.dart';

class PrescriptionServicesDoctor {
  void doctorPrescription({
    required BuildContext context,
    required String doctorName,
    required String name,
    required int phone,
    required String caseHistory,
    required String diagnosis,
    required String labTests,
    required String medicine,
    required String remarks,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Prescrption prescrption = Prescrption(
          doctorName: doctorName,
          name: name,
          phone: phone,
          labTests: labTests,
          medicine: medicine,
          remarks: remarks,
          caseHistory: caseHistory,
          diagnosis: diagnosis,
      );

      http.Response res = await http.put(
        Uri.parse('$uri/api/dash/presc'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: prescrption.toJson(),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Prescription Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
