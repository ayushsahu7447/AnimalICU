import 'package:animalicu/auth/screen/registration.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import '../widget/myheader.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final controller = ScrollController();
  double offset = 0;
  bool _isSelected = false;
  bool passwordInvisible = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  void signInUser() {
    authService.signInUser(
      context: context,
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInFormKey,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                textTop: "“पशु” कोई चीज़ नहीं हैं \nबल्कि जीवित जीव हैं,",
                textBottom: "जो हमारी करुणा, सम्मान, \nदोस्ती और समर्थन के योग्य हैं।”",
                offset: offset,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Container(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            autofocus: false,
                            controller: emailcontroller,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Name");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailcontroller.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "example@gmail.com",
                              hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Password",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            autofocus: false,
                            controller: passwordcontroller,
                            keyboardType: TextInputType.name,
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
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),
                            GestureDetector(
                              onTap: _radio,
                              child: radioButton(_isSelected),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text("Remember me",
                                style: TextStyle(
                                    fontSize: 12, fontFamily: "Poppins-Medium"))
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.indigo,
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  if (_signInFormKey.currentState!.validate()) {
                                    signInUser();
                                  }
                                },
                                child: Center(
                                  child: Text("SIGNIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        horizontalLine(),
                        Text("Animal ICU",
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "Poppins-Medium")),
                        horizontalLine()
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User?  ",
                          style: TextStyle(fontFamily: "Poppins-Medium"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()),
                          );

                          },
                          child: Text("SignUp",
                              style: TextStyle(
                                  color: Color(0xFF5d74e3),
                                  fontFamily: "Poppins-Bold")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: 30,
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    )
        : Container(),
  );

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}