import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiz_app/news_paper.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/data/queries.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  void restartExam() {
    setState(() {
      selectedAnswers = [];
    });
    switchScreen();
  }

  Widget? currentPage;
  void chooseAnswer(String answerr) {
    selectedAnswers.add(answerr);
    if (selectedAnswers.length == queries.length) {
      setState(() {
        // selectedAnswers = [];
        currentPage = ResultScreen(
          chooseenAnswers: selectedAnswers,
          restart: restartExam,
        );
      });
    }
  }

  // Widget? currentPage;
  @override
  void initState() {
    currentPage = StartScreen(
      switchScreen,
      newsPaper,
    );
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currentPage = Questions(onSelectedAnswer: chooseAnswer);
    });
  }

  void newsPaper() {
    // setState(() {
    //   // currentPage = NewsPaper(onSelectedAnswer: chooseAnswer);
    // });

    Fluttertoast.showToast(
        msg: "News paper updates are coming soon!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 254),
        textColor: const Color.fromARGB(255, 14, 62, 78),
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 42, 3, 77),
                Color.fromARGB(255, 35, 4, 121)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: currentPage,
        ),
      ),
    );
  }
}
