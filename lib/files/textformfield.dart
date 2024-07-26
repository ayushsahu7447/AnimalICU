import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.myController, required this.fieldName, this.myIcon = Icons.verified_user_outlined, this.prefixIconColor = Colors.blueAccent,required this.keyboard, this.maxlines, required this.onSaved}) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;
  final TextInputType keyboard;
  final maxlines;
  final ValueChanged<String?>? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        maxLines: maxlines,
        keyboardType: keyboard,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please enter some text';
          }
          else null;
        },
        controller: myController,
        decoration: InputDecoration(
            labelText: fieldName,
            prefixIcon: Icon(myIcon, color: prefixIconColor,),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.indigo[900]!)
            ),
            labelStyle: TextStyle(color: Colors.indigo[900])
        ),
        onSaved: onSaved,
      ),
    );
  }
}
