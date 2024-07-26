import 'package:animalicu/Patient/Prescription_download.dart';
import 'package:animalicu/dashboard/screen/patient_list.dart';
import 'package:animalicu/dashboard/widget/complaint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Patient/appointment/appointment.dart';
import '../../VideoCall/videocall_screen.dart';
import '../../auth/service/user_provider.dart';
import '../../dashboard/service/service/patientService.dart';
import '../../files/prescription_form.dart';
import '../../loader.dart';

class dashboard_doctor extends StatefulWidget {
  static const String id = 'MeetingScreen';
  const dashboard_doctor({Key? key}) : super(key: key);

  @override
  State<dashboard_doctor> createState() => _dashboard_doctorState();
}

class _dashboard_doctorState extends State<dashboard_doctor> {
  List? patientList = [];
  List? patientDataList = [];
  List? patientCatList = [];
  List? patientCodeList = [];

  @override
  void initState() {
    super.initState();
    fethdata();
  }

  final patientService patientServices = patientService();
  fethdata() async {
    patientList = await patientServices.patientData(context: context);
    patientDataList = await patientServices.patientQeue(context: context);
    patientCatList = await patientServices.patientCategory(context: context);
    patientCodeList = await patientServices.patientCode(context: context);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final size =  MediaQuery.of(context).size;

    final user = Provider.of<UserProvider>(context).user;
    return user.name ==null ?Loader():SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [

              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0 ,top:8),
                      child: Image.asset("assets/png/AnimalICU.png", height: size.height/8,),
                    ),
                    Spacer(),
                    SvgPicture.asset("assets/svg/upright.svg",height: size.height/10, width: size.width/2, )
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Container(
                height: size.height / 8,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),],
                  borderRadius:
                  BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Stack(children: [
                  Positioned(
                      top: 8,
                      left: 8,
                      child: Stack(
                        children: [
                          Container(
                            height: size.height / 10,
                            width: size.width / 5.5,
                            decoration: const BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)),
                            ),
                            child: Lottie.asset('assets/lottie/vc.json'),
                          ),

                        ],
                      )),
                  Positioned(
                      bottom: 12,
                      right: 10,
                      child: Stack(
                        children: [Center(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                            color: Colors.amber[600],
                            highlightColor: Colors.white ,
                            splashColor: Colors.amber,
                            child: Padding(
                                padding:  EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: size.width/7.5 ),
                                child: Row(
                                  children: [
                                    Icon(Icons.videocam_outlined , size: 22, color: Colors.white,),
                                    Text("  Call " , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ,fontSize: 15),),
                                  ],
                                )
                            ),
                            onPressed: () {Navigator.of(context).pushNamed(VideoCallScreen.id);},
                          ),
                        ),
                        ],
                      )),

                ]),
              ),
              SizedBox(height: 20,),

              Center(
                child: Container(
                  height: size.height / 7,
                  width: size.width / 1.2,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: patientDataList!.isEmpty
                      ? Loader()
                      : Center(
                      child: SingleChildScrollView(
                        child: Container(
                          height: size.height,
                          width: size.width / 1.3,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "  Name  ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "  Problem  ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "  Code  ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 1,
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: patientDataList!.length,
                                          itemBuilder: (context, index) {
                                            return Center(
                                              child: Text(
                                                patientDataList![index] , style: TextStyle(fontWeight:FontWeight.bold,fontSize: 12 , color: Colors.indigo[900]) ,),
                                            );
                                          }),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: patientDataList!.length,
                                          itemBuilder: (context, index) {
                                            return Center(
                                              child: Text(
                                                patientCatList![index], style: TextStyle(fontWeight:FontWeight.bold,fontSize: 12 , color: Colors.indigo[900]),),
                                            );
                                          }),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: patientDataList!.length,
                                          itemBuilder: (context, index) {
                                            return Center(
                                              child: Text(
                                                patientCodeList![index], style: TextStyle(fontWeight:FontWeight.bold,fontSize: 12 , color: Colors.indigo[900]),),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Prescriptionx()),
                    );},
                    child: Container(
                      height: size.height / 9,
                      width: size.width / 4,
                      decoration:  BoxDecoration(
                        color: Colors.indigo[900],

                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          SvgPicture.asset(
                            "assets/svg/stetho.svg",height: size.height/30,
                          ),
                          Spacer(),
                          Center(child: Text("Prescription", style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)),
                          Spacer()
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientList()),
                    );},
                    child: Container(
                      height: size.height / 9,
                      width: size.width / 4,
                      decoration:  BoxDecoration(
                        color: Colors.amber[600],

                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Icon(
                            Icons.safety_divider,size: size.height/30,color: Colors.black,
                          ),
                          Spacer(),
                          Center(child: Text("Patient List", style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)),
                          Spacer()
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComplaintEmail()),
                    );},
                    child: Container(
                      height: size.height / 9,
                      width: size.width / 4,
                      decoration:  BoxDecoration(
                        color: Colors.indigo[900],

                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Icon(Icons.call_outlined,size: size.height/30,color: Colors.white,
                          ),
                          Spacer(),
                          Center(child: Text("Contact Us", style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),)),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    ));
  }
}
