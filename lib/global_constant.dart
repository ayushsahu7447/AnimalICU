import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String uri = 'http://13.232.92.44:3090';

void showSnackBar(context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600),
          ),
        ),
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(15),
        elevation: 1,
        backgroundColor: Colors.amber[600],
      ),
    );

void httpErrorHandling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      showSnackBar(context, "Account Created Successfully :)");
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 401:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 404:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;

    default:
      showSnackBar(context, response.body);
  }
}
