import 'package:animalicu/Patient/service/prescription_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final nameController = TextEditingController();
  final mobController = TextEditingController();
  final PrescriptionService prescriptionService = PrescriptionService();
  final _prescriptionFormKey = GlobalKey<FormState>();
  List<String> presciptionData1 = [];

  @override
  void initState() {
    super.initState();
    prescriptionData();
  }

  prescriptionData() async {
    presciptionData1 = await prescriptionService.prescriptionData(
        context: context,
        name: nameController.text,
        phone: int.parse(mobController.text));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        title: Row(
          children: [
            const Text(
              "Prescription ",
              style: TextStyle(
                  fontFamily: 'Manrope', fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 14.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipOval(
                    child: SvgPicture.asset(
                      "assets/svg/stetho.svg",
                    ),
                  )),
            ),
          ),
        ],
      ),
      body: Form(
        key: _prescriptionFormKey,
        child: Container(
          color: Colors.indigo[900],
          child: Center(
            child: Container(
              height: size.height / 2.4,
              width: size.width / 1.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        "Get Your Prescription",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Name");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nameController.text = value!;
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
                          hintText: "Enter Your Name Here",
                          hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autofocus: false,
                        controller: mobController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Number");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          mobController.text = value!;
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
                          hintText: "Enter Your Phone No.",
                          hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10,
                      ),
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0))),
                        color: Colors.amber[600],
                        highlightColor: Colors.white,
                        splashColor: Colors.deepOrange,
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          if (_prescriptionFormKey.currentState!.validate()) {
                            prescriptionData();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
