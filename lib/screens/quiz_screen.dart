import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'result_screen.dart';
import '../models/question.dart';  // ここにAnswerクラスがある想定
import '../data/questions.dart';   // これはquestionsリストのあるファイル


// ✅ AnswerRecord クラスはファイルの先頭（Widgetの外）に置く
class AnswerRecord {
  final String question;
  final String selectedAnswer;
  final String correctAnswer;
  final bool isCorrect;

  AnswerRecord({
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.isCorrect,
  });
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;
  List<AnswerRecord> _answerRecords = [];

  void _answerQuestion(Answer selectedAnswer) {
    final currentQuestion = questions[_questionIndex];
    final correctAnswer = currentQuestion.answers.firstWhere((a) => a.isCorrect);

    _answerRecords.add(
      AnswerRecord(
        question: currentQuestion.questionText,
        selectedAnswer: selectedAnswer.text,
        correctAnswer: correctAnswer.text,
        isCorrect: selectedAnswer.isCorrect,
      ),
    );

    if (selectedAnswer.isCorrect) _score++;

    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            answerRecords: _answerRecords,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('クイズ')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  questions[_questionIndex].questionText,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...questions[_questionIndex].shuffledAnswers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer), // ✅ 修正ポイント
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                        child: Text(answer.text, style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
