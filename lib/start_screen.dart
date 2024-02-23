import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.newsPaper, {super.key});

  final void Function() startQuiz;
  final void Function() newsPaper;

  // ignore: unused_element
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void toaster(context, message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 255, 218, 215),
        textColor: const Color.fromARGB(255, 14, 62, 78),
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 350,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          const Text(
            'Learn Flutter the fun way!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startQuiz();
                  // _showToast(context);
                  // toaster(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 127, 7, 148),
                  elevation: 3.0,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_right),
                    Text('Start Quiz'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  newsPaper();
                  // _showToast(context);
                  // toaster(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 131, 137),
                  elevation: 3.0,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_right),
                    Text('Newspaper'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
