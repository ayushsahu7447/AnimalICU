import 'dart:convert';
import 'package:animalicu/auth/screen/loginui.dart';
import 'package:animalicu/auth/service/user_provider.dart';
import 'package:animalicu/dashboard/bottom_nav_bar.dart';
import 'package:animalicu/doctor/widget/bottom_nav_bar__doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_constant.dart';
import '../../models/user.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required int phone,
    required String gender,
    required String dob,
    required String qualification,
    required String occupation,
    required String address,
    required String type,
  }) async {
    try {
      User user = User(
          id: "",
          name: name,
          email: email,
          phone: phone,
          password: password,
          address: address,
          dob: dob,
          gender: gender,
          qualification: qualification,
          occupation: occupation,
          type: type,
          token: "");

      http.Response res = await http.post(
        Uri.parse('$uri/api/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['_id']);
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  Provider.of<UserProvider>(context).user.type == 'Doctor'
                      ? BottomBarDoctor()
                      : const BottomBar(),
                ));
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(
    BuildContext context,
  ) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loginScreen()));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
