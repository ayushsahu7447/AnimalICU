import 'package:flutter/material.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOption({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      width: size.width / 2.6,
      decoration: BoxDecoration(
        color: Colors.indigo[900],
        borderRadius: BorderRadius.all(
            Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 14 , color: Colors.white , fontWeight: FontWeight.bold),
            ),
          ),
          Switch.adaptive(
            activeColor: Colors.amber,
            activeTrackColor: Colors.white,
            value: isMute,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}