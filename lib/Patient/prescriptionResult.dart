import 'package:flutter/material.dart';

class PresResu extends StatelessWidget {
  final List<String>? presciptionData1;
  const PresResu({super.key, required this.presciptionData1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Animal ICU",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Manrope"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: 2,
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            "Doctor Name : ${presciptionData1![0]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Text(
            "Patient Name : ${presciptionData1![1]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Text(
            "Patient PhoneNumber : ${presciptionData1![2]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  border: Border.all(color: Colors.blueAccent, width: 2)),
              child: const Text(
                "Reports",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Text(
            "Diagnosis : ${presciptionData1![3]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Text(
            "LabTests : ${presciptionData1![4]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Text(
            "Medicine : ${presciptionData1![5]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Text(
            "Remarks : ${presciptionData1![6]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          Text(
            "Date of Checkup : ${presciptionData1![7]}",
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
