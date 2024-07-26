import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../auth/service/user_provider.dart';
import '../../files/forms_presc.dart';
import '../../global_constant.dart';
class PrescriptionService {
  Future<List<String>> prescriptionData({
    required BuildContext context,
    required String name,
    required int phone,
  }) async {
    List<String> presciptionData = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/dash/prescption'),
        body: jsonEncode({
          'name': name,
          'phone': phone,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]['doctorName']),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]['name']),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]['phone']),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]['diagnosis']),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]["labTests"]),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]["medicine"]),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]["remarks"]),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]["caseHistory"]),
            );
            presciptionData.add(
              jsonEncode(jsonDecode(res.body)["lastPresc"]["createdAt"]),
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => form_presc(
                    presciptionData1: presciptionData,
                  )),
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return presciptionData;
  }
}
