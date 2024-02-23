// import 'dart:ffi';

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.ans, this.ontap, {super.key});

  final String ans;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      width: double.infinity,
      // decoration: BoxDecoration(),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // minimumSize: Size(
          //   width: double.infinity,
          // ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 25,

            // horizontal: 60,
          ),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: ontap,
        child: Text(
          ans,
          textAlign: TextAlign.center,
          style: const TextStyle(
            height: 1.3,
          ),
        ),
      ),
    );
  }
}
