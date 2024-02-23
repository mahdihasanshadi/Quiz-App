import 'package:flutter/material.dart';
import 'package:quiz_app/data/queries.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chooseenAnswers,
    required this.restart,
  });

  final void Function() restart;
  final List<String> chooseenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseenAnswers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': queries[i].text,
          'correct_answer': queries[i].answers[0],
          'user_answer': chooseenAnswers[i],
        },
      );
    }
    return summary;
  }

  // final void Function() endQuiz;

  @override
  Widget build(BuildContext context) {
    final finalData = getSummaryData();
    final numOfTotalAnswer = queries.length;
    final numOfCorrectAnswer = finalData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              children: [
                Text(
                  "You answered $numOfCorrectAnswer out of $numOfTotalAnswer questions correctly!",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                QuestionsSummary(finalData),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: restart, child: const Text('Restart now :)'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
