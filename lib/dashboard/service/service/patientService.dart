import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../auth/service/user_provider.dart';
import '../../../global_constant.dart';

class patientService {
  Future<List> patientData({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<String> patientList = [];

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/dash/appointment'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);

          patientList
              .add(jsonEncode(response["deatil"]["appointedPatientCount"]));
          patientList.add(
              jsonEncode(response["deatil"]["filterAppointedPatientCount"]));
          patientList.add(jsonEncode(response["deatil"]["resultPerPage"]));
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return patientList;
  }

  Future<List> patientQeue({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<String> patientDataList = [];

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/dash/appointment'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          for (int i = 0;
              i < response["deatil"]["appointedPatients"].length;
              i++) {
            patientDataList.add(
                jsonEncode(response["deatil"]["appointedPatients"][i]["name"]));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return patientDataList;
  }

  Future<List> patientCategory({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<String> patientCatList = [];

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/dash/appointment'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          for (int i = 0;
              i < response["deatil"]["appointedPatients"].length;
              i++) {
            patientCatList.add(jsonEncode(
                response["deatil"]["appointedPatients"][i]["problemCategory"]));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return patientCatList;
  }

  Future<List> patientCode({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<String> patientCatList = [];

    try {
      http.Response res =
      await http.get(Uri.parse('$uri/api/dash/appointment'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          for (int i = 0;
          i < response["deatil"]["appointedPatients"].length;
          i++) {
            patientCatList.add(jsonEncode(
                response["deatil"]["appointedPatients"][i]["code"]));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return patientCatList;
  }
}
