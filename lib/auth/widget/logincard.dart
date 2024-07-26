import 'package:flutter/material.dart';

class loginCard extends StatelessWidget {
  bool passwordInvisible = true;

  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 15.0),
                  blurRadius: 15.0),
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, -10.0),
                  blurRadius: 10.0),
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Login",
                  style: TextStyle(color: Colors.indigo,
                      fontSize: 40,
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6)),
              SizedBox(
                height: 30,
              ),
              Text("Email",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16)),
              TextField(
                decoration: InputDecoration(
                    hintText: "ayushsahu@gmail.com",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              SizedBox(
                height: 16,
              ),
              Text("Password",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordInvisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ), onPressed: () { },
                    ),
                    hintText: "**********",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      );
  }
}