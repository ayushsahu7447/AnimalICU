
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../auth/service/user_provider.dart';
import '../../loader.dart';
import '../service/service/patientService.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
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
    patientDataList = await patientServices.patientQeue(context: context);
    patientCatList = await patientServices.patientCategory(context: context);
    patientCodeList = await patientServices.patientCode(context: context);
    setState(() {});
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        backgroundColor:Colors.indigo[900],
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          elevation: 0,
          title: Row(
            children: [
              const Text(
                "Appointments",
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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 30.0, right: 30, top: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Appointed Animals in Queue',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: size.height / 2,
                  width: size.width / 1.2,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(222, 221, 221, 1.0),
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
            ],
          ),
        ));
  }
}
