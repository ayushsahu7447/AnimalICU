
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../dashboard/widget/complaint.dart';
import '../service/auth_service.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final dobcontroller = TextEditingController();
  final qualification = TextEditingController();
  final occupation = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();

  List<String> abc = ['Male ', 'Female', "Prefer not to say"];
  String selectedvalue12 = 'Male ';
  String typem = 'Patient';


  void signUpUser() {
    authService.signUpUser(
      context: context,
      gender: selectedvalue12,
      name: namecontroller.text,
      email: emailcontroller.text,
      phone: int.parse(phonecontroller.text),
      password: passwordcontroller.text,
      dob: dobcontroller.text,
      qualification: qualification.text,
      occupation: occupation.text,
      address: addresscontroller.text,
      type: typem,

    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _signUpFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: size.height / 5,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        top: 30,
                        right: 0,
                        child: Stack(
                          children: [
                            Image.asset("assets/png/AnimalICU.png"),
                            Positioned(
                              right: 25,
                              top: 40,
                              child: SvgPicture.asset(
                                "assets/svg/stethoscope.svg",
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ])),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/heart.svg",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Animal ICU - Registration',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 40),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Name ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: namecontroller,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          namecontroller.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Ayush Sahu",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Email Address ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: emailcontroller,
                        keyboardType: TextInputType.name,
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
                                color: Colors.indigoAccent, width: 2),
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
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Mobile Number ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: phonecontroller,
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          phonecontroller.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "+91",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),


                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' DOB ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),

                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: dobcontroller,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          dobcontroller.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "03/03/2003",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),


                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Qualification ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: qualification,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          qualification.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Qualification",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),



                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Occupation ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: occupation,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          occupation.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Occupation",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),


                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Address ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: addresscontroller,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          addresscontroller.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Address",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),


                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30, top: 15),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' Gender:  ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: 150,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color:
                                  const Color.fromARGB(255, 227, 242, 253),
                                  width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 207, 234, 255),
                                  width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.indigo,
                          ),
                          hint: const Text("Select Options: "),
                          value: selectedvalue12,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          isExpanded: true,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                          items: abc
                              .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(fontSize: 18))))
                              .toList(),
                          onChanged: (String? item) {
                            setState(() => selectedvalue12 = item!);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30, top: 25, bottom: 25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ' Password ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        autofocus: false,
                        controller: passwordcontroller,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          passwordcontroller.text = value!;
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
                                color: Colors.indigoAccent, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Password",
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30, bottom: 25),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  color: Colors.indigo,
                  highlightColor: Colors.white,
                  splashColor: Colors.amber,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: size.width / 4),
                      child: Text(
                        'Registration',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  onPressed: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Text(
                    'Forgot Password ?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ComplaintEmail()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.indigoAccent,
                              Colors.black,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: size.width / 4,
                      height: 1.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        "Animal ICU",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                            decoration: TextDecoration.none,
                            fontSize: 15.0),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.indigoAccent,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      width: size.width / 4,
                      height: 1.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
