import 'package:flutter/material.dart';

class TextFormWiddgy extends StatelessWidget {
  const TextFormWiddgy({
    required this.descriptioncontroller,
    required this.formPlaceHolder,
    this.maxLines,
    required this.maxlength,
    this.countext
  });

  final TextEditingController descriptioncontroller;
  final String formPlaceHolder;
  final int ? maxLines;
  final int maxlength;
  final String ? countext;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        validator: (value) {
          if ( value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        maxLines: maxLines,
        maxLength: maxlength,
        decoration: InputDecoration(hintText: formPlaceHolder,
          counterText: '',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 40),),
        controller: descriptioncontroller,

        // autofocus: true,
        // onChanged: (newText) {
        //   newTasksTitle = newText;
        // },
        textAlign: TextAlign.center,
      ),
    );
  }
}