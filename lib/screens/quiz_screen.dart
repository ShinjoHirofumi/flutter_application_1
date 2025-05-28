import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) _score++;

    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: _score)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('クイズ')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[_questionIndex].questionText, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ...questions[_questionIndex].answers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(answer.isCorrect),
                  child: Text(answer.text, style: const TextStyle(fontSize: 16)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
