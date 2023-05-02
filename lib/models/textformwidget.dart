import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWiddgy extends StatelessWidget {
  const TextFormWiddgy(
      {super.key,
        required this.texteditingcontroller,
      required this.formPlaceHolder,
      this.maxLines,
      required this.maxlength,
      this.countext});

  final TextEditingController texteditingcontroller;
  final String formPlaceHolder;
  final int? maxLines;
  final int maxlength;
  final String? countext;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        validator: (malue) {
          if (malue!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        maxLines: maxLines,
        maxLength: maxlength,
        decoration: InputDecoration(
          hintText: formPlaceHolder,
          counterText: countext,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 40),
        ),
        controller: texteditingcontroller,

        // autofocus: true,
        // onChanged: (newText) {
        //   newTasksTitle = newText;
        // },
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TextFormYear extends StatelessWidget {
  const TextFormYear(
      {required this.yeareditingcontroller,
      required this.formPlaceHolder,
      this.maxLines,
      required this.maxlength,
      });
  final TextEditingController yeareditingcontroller;
  final String formPlaceHolder;
  final int? maxLines;
  final int maxlength;

  final int maxyear = 2024;
  final int minyear = 1920;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          // if ()
          try {
             int.parse(value);


          } catch (e) {
            print(e);
            return 'this is not a year';
          }
          if (minyear <= int.parse(value) || int.parse(value) <= maxyear) {
            return 'Put some real things in it, My lord!';
          }
          return null;
        },
        maxLines: maxLines,
        maxLength: maxlength,
        decoration: InputDecoration(
          hintText: formPlaceHolder,
          counterText: '',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 40),
        ),
        controller: yeareditingcontroller,

        // autofocus: true,
        // onChanged: (newText) {
        //   newTasksTitle = newText;
        // },
        textAlign: TextAlign.center,
      ),
    );
  }
}
