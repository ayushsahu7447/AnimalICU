import 'package:animalicu/files/services/prescription_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'textformfield.dart';

class Prescriptionx extends StatefulWidget {
  const Prescriptionx({Key? key}) : super(key: key);

  @override
  State<Prescriptionx> createState() => _PrescriptionxState();
}

class _PrescriptionxState extends State<Prescriptionx> {


  final patientname = TextEditingController();
  final patientmobileNumber = TextEditingController();
  final doctorname = TextEditingController();
  final labtest = TextEditingController();
  final diagonosis = TextEditingController();
  final remark = TextEditingController();
  final medicalcondition = TextEditingController();

  final medicines = TextEditingController();
  final caseHistory = TextEditingController();
  final _prescriptionFormKey = GlobalKey<FormState>();
  final PrescriptionServicesDoctor prescriptionServicesDoctor =
  PrescriptionServicesDoctor();

  void patientAppointment() {
    if (_prescriptionFormKey.currentState!.validate()) {
      prescriptionServicesDoctor.doctorPrescription(
          context: context,
          doctorName: doctorname.text,
          name: patientname.text,
          phone: int.parse(patientmobileNumber.text),
          caseHistory: caseHistory.text,
          diagnosis: diagonosis.text,
          labTests: labtest.text,
          medicine: medicines.text,
          remarks: remark.text,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left:20, top: 20,right: 20),
          child: Form(
            key: _prescriptionFormKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 7, bottom: 20),
                  child: Align(alignment: Alignment.topLeft,child: Text("Please Fill the Prescription Form", style: TextStyle(color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w500),),),
                ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: patientname, fieldName: 'Patient Name',myIcon: Icons.person,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text, onSaved: (value) {
                      patientname.text = value!;
                    }, )),
                    Expanded(child: MyTextField(myController: doctorname, fieldName: 'Doctor Name',myIcon: Icons.local_hospital,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,onSaved: (value) {
                      doctorname.text = value!;
                    }, )),

                  ],
                ),

                Row(
                  children: [
                    Expanded(child: MyTextField(myController: caseHistory, fieldName: 'Case History.',myIcon: Icons.history,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.number,onSaved: (value) {
                      caseHistory.text = value!;
                    }, )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: patientmobileNumber, fieldName: 'Patient Mobile No.',myIcon: Icons.phone,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.number,onSaved: (value) {
                      patientmobileNumber.text = value!;
                    }, )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: labtest, fieldName: 'Lab Test',myIcon: Icons.local_hospital_outlined,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,maxlines: 4, onSaved: (value) {
                      labtest.text = value!;
                    },)),
                    Expanded(child: MyTextField(myController: medicines, fieldName: 'Medicine ',myIcon: Icons.local_pharmacy_outlined,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,maxlines: 4, onSaved: (value) {
                      medicines.text = value!;
                    },)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: MyTextField(myController: diagonosis, fieldName: 'Diagnosis',myIcon: Icons.medical_services,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,maxlines: 4, onSaved: (value) {
                      diagonosis.text = value!;
                    },)),
                    Expanded(child: MyTextField(myController: remark, fieldName: 'Remark ',myIcon: Icons.local_hospital_outlined,prefixIconColor: Colors.indigo[900]!,keyboard: TextInputType.text,maxlines: 4, onSaved: (value) {
                      remark.text = value!;
                    },)),
                  ],
                ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Align(alignment: Alignment.topLeft,child: Text("Diagnosis - ", style: TextStyle(color: Colors.indigo, fontSize: 13, fontWeight: FontWeight.w500),),),
                //       ),
                //       DropdownButton<String>(
                //         value: diagonosis1,
                //         items: <String>['Yes', 'No', 'Prefer not\nto Say'].map((String item) {
                //           return DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(item,style: TextStyle(fontSize: 12,color: Colors.indigo, fontWeight: FontWeight.bold),),
                //           );
                //         }).toList(),
                //         hint: Text("Diagonosis", style: TextStyle(color: Colors.indigo),),
                //         onChanged: (String? item) {
                //         setState(() => diagonosis1 = item!);
                //         },
                //       ),SizedBox(width: 10,),
                //       Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Align(alignment: Alignment.topLeft,child: Text("Remarks - ", style: TextStyle(color: Colors.indigo, fontSize: 13, fontWeight: FontWeight.w500),),),
                //       ),
                //       DropdownButton<String>(
                //         items: <String>['Yes', 'No'].map((String item) {
                //           return DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(item,
                //               style:  TextStyle(
                //                   fontSize: 12, color:  Colors.indigo)),
                //           );
                //         }).toList(),
                //         hint: Text("Remarks", style: TextStyle(color: Colors.indigo)),
                //         onChanged: (String? item) {
                //           setState(() => remark1 = item!);
                //         },
                //         value: remark1,
                //       )
                //       ],
                //   ),
                // ),


                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(12.0))),
                  color: Colors.indigo,
                  highlightColor: Colors.white,
                  splashColor: Colors.amber,
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
