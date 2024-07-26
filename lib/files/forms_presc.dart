import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;


class form_presc extends StatelessWidget {
  final List<String>? presciptionData1;
  form_presc({super.key, required this.presciptionData1});

  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: _printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: RepaintBoundary(

                key: _printKey,
                child: Stack(

                  children:[
                    Container(
                      height: size.height/1.3,
                      width: size.width,
                      child: Center(
                        child: Opacity(
                          opacity: 0.3, //from 0-1, 0.5 = 50% opacity
                          child: Image.asset(
                            "assets/png/AnimalICU.png",
                            height: size.height/3,
                          ),
                        ),
                      ),
                    ),
                    Container(
                    height: size.height/1.3,
                    width: size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                          height: size.height / 10,
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Dr ${presciptionData1![0]}",
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Doctor",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Mob No. xxxxxxxxxx",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Image.asset("assets/png/AnimalICU.png"),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Animal ICU",
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Heart of Perfect Caring",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Contact on Email",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                          height: size.height / 6,
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "ID 1 - ${presciptionData1![1]}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Mobile No.: ${presciptionData1![2]}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          new Text(
                                            "Know History -: ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "- ${presciptionData1![7]}",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Date:${presciptionData1![8]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: size.height / 40,
                          decoration: BoxDecoration(
                              color: Colors.indigo[200],
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Cheif Complaint",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height / 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "*. ${presciptionData1![3]}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                          height: size.height / 8,
                          width: size.width,
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          new Text(
                                            "Labn Test",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "- ${presciptionData1![4]}",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height / 40,
                          decoration: BoxDecoration(
                              color: Colors.indigo[200],
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Medicine Name",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height / 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${presciptionData1![5]}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                          height: size.height / 4.5,
                          width: size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              new Text(
                                                "Remarks:",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "${presciptionData1![6]}",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Signature",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${presciptionData1![0]}",
                                              style: TextStyle(
                                                  color: Colors.indigo[900],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Doctor",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "From: Animal ICU",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),

            ),
            MaterialButton(
              color: Colors.indigo[900],
                child: Container(height: 30,width: 30,
                child: Center(child: Text("Print", style: TextStyle(color: Colors.white),)),),
                onPressed: _printScreen
            )
          ],
        ),
      ),
    );
  }
}


