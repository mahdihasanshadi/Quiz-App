import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/queries.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});
  final void Function(String aans) onSelectedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentIndex = 0;

  void actualIndex(selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    if (currentIndex < queries.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void changeIndex({bool isPositive = true}) {
    if (isPositive && currentIndex >= 0 && currentIndex < queries.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else if (isPositive == false) {
      if (currentIndex > 0) {
        setState(() {
          currentIndex--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = queries[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: ,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              // "The question",
              currentQuestion.text,
              style: TextStyle(
                color: Colors.white.withOpacity(
                  .7,
                ),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.getShuffledList().map(
            (answer) {
              // print(currentIndex.toString());
              return AnswerButton(
                answer,
                () {
                  actualIndex(answer);
                },
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
              top: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      changeIndex(isPositive: false);
                    },
                    child: const Text("Prev")),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: const Text(
                //     'Submit :)',
                //   ),
                // ),
                ElevatedButton(
                    onPressed: () {
                      changeIndex(isPositive: true);
                    },
                    child: const Text("Next"))
              ],
            ),
          )
        ],

        //   AnswerButton(currentQuestion.answers[0], () {}),
        //   AnswerButton(currentQuestion.answers[1], () {}),
        //   AnswerButton(currentQuestion.answers[2], () {}),
        //   AnswerButton(currentQuestion.answers[3], () {}),
        // ],
      ),
    );
  }
}
