import 'package:animalicu/Patient/appointment/appointment_service.dart';
import 'package:animalicu/files/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class appointment extends StatefulWidget {
  const appointment({Key? key}) : super(key: key);

  @override
  State<appointment> createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  static const String routeName = '/appointment';

  String gender = 'Male';
  String problem_category = 'Lumpy';

  final patientname = TextEditingController();
  final patientphone = TextEditingController();
  final patientcode = TextEditingController();
  final patientage = TextEditingController();
  final cheif_complaint = TextEditingController();
  final duration_of_problem = TextEditingController();
  final cheif_complaint_history = TextEditingController();
  final _patientAppointmentFormKey = GlobalKey<FormState>();
  final AppointmentService appointmentService = AppointmentService();

  void patientAppointment() {
    if (_patientAppointmentFormKey.currentState!.validate()) {
      appointmentService.patientAppointment(
          context: context,
          name: patientname.text,
          code: patientcode.text,
          phone: int.parse(patientphone.text),
          age: patientage.text,
          gender: gender,
          problemCategory: problem_category,
          chiefCompliant: cheif_complaint.text,
          duration: duration_of_problem.text,
          history: cheif_complaint_history.text);
    }
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
            Text(
              "Appointment ",
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
                  width: 30,
                  height: 30,
                  child: ClipOval(
                    child: SvgPicture.asset("assets/svg/man.svg",),
                  )),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(235, 238, 239, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:20, top: 20,right: 20),
          child: Form(
            key: _patientAppointmentFormKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 7, bottom: 20),
                  child: Align(alignment: Alignment.topLeft,child: Text("Please Fill the Appointment", style: TextStyle(color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w500),),),
                ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: patientname, fieldName: 'Name/Type',myIcon: Icons.person,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text, onSaved: (value) {
                      patientname.text = value!;
                    }, )),
                    Expanded(child: MyTextField(myController: patientcode, fieldName: 'Call Code',myIcon: Icons.code,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.number,onSaved: (value) {
                      patientcode.text = value!;
                    }, )),

                  ],
                ),

                Row(
                  children: [
                    Expanded(child: MyTextField(myController: patientage, fieldName: 'Age :',myIcon: Icons.history,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.number,onSaved: (value) {
                      patientage.text = value!;
                    }, )),
                    Expanded(child: MyTextField(myController: patientphone, fieldName: 'Mobile No :',myIcon: Icons.phone,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.number,onSaved: (value) {
                      patientphone.text = value!;
                    }, )),
                  ],
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(alignment: Alignment.topLeft,child: Text("Problem Category - ", style: TextStyle(color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w500),),),
                      ),
                      DropdownButton<String>(
                        items: <String>['Lumpy', 'Infectious', 'Deficiency', 'Hereditary'].map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                                style:  TextStyle(
                                    fontSize: 12, color:  Colors.indigo[900])),
                          );
                        }).toList(),
                        hint: Text("Problem Category", style: TextStyle(color: Colors.indigo[900])),
                        onChanged: (String? item) {
                          setState(() => problem_category = item!);
                        },
                        value: problem_category,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(alignment: Alignment.topLeft,child: Text("Gender - ", style: TextStyle(color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w500),),),
                      ),
                      DropdownButton<String>(
                        items: <String>['Male', 'Female', 'None'].map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                              style:  TextStyle(
                                  fontSize: 12, color:  Colors.indigo[900])),
                          );
                        }).toList(),
                        hint: Text("Gender", style: TextStyle(color: Colors.indigo[900])),
                        onChanged: (String? item) {
                          setState(() => gender = item!);
                        },
                        value: gender,
                      )
                      ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: cheif_complaint, fieldName: 'Chief Complaint',myIcon: Icons.local_hospital_outlined,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,maxlines: 4, onSaved: (value) {
                      cheif_complaint.text = value!;
                    },)),
                    Expanded(child: MyTextField(myController: duration_of_problem, fieldName: 'Duration of\n Problem ',myIcon: Icons.timelapse,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,maxlines: 4, onSaved: (value) {
                      duration_of_problem.text = value!;
                    },)),
                  ],
                ),


                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Align(alignment: Alignment.topLeft,child: Text("Diagnosis - ", style: TextStyle(color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w500),),),
                //       ),
                //       DropdownButton<String>(
                //         value: diagonosis1,
                //         items: <String>['Yes', 'No', 'Prefer not\nto Say'].map((String item) {
                //           return DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(item,style: TextStyle(fontSize: 12,color: Colors.indigo[900], fontWeight: FontWeight.bold),),
                //           );
                //         }).toList(),
                //         hint: Text("Diagonosis", style: TextStyle(color: Colors.indigo[900]),),
                //         onChanged: (String? item) {
                //         setState(() => diagonosis1 = item!);
                //         },
                //       ),SizedBox(width: 10,),
                //       Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Align(alignment: Alignment.topLeft,child: Text("Remarks - ", style: TextStyle(color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w500),),),
                //       ),
                //       DropdownButton<String>(
                //         items: <String>['Yes', 'No'].map((String item) {
                //           return DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(item,
                //               style:  TextStyle(
                //                   fontSize: 12, color:  Colors.indigo[900])),
                //           );
                //         }).toList(),
                //         hint: Text("Remarks", style: TextStyle(color: Colors.indigo[900])),
                //         onChanged: (String? item) {
                //           setState(() => remark1 = item!);
                //         },
                //         value: remark1,
                //       )
                //       ],
                //   ),
                // ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: cheif_complaint_history, fieldName: 'Any Medical Condition?\n/ Allergies?',myIcon: Icons.medication_liquid_sharp,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.number,maxlines: 2,onSaved: (value) {
                      cheif_complaint_history.text = value!;
                    }, )),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(12.0))),
                  color: Colors.amber[600],
                  highlightColor: Colors.white,
                  splashColor: Colors.indigo,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                  onPressed: patientAppointment,
                ),
              ]
              ,
            ),
          ),
        ),
      ),
    );
  }
}
