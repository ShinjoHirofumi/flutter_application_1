import 'dart:math';

class Answer {
  final String text;
  final bool isCorrect;

  Answer({required this.text, required this.isCorrect});
}

class Question {
  final String questionText;
  final List<Answer> answers;

  Question({required this.questionText, required this.answers});

  // シャッフルされた選択肢を取得
  List<Answer> get shuffledAnswers {
    final shuffled = List<Answer>.from(answers);
    shuffled.shuffle(Random());
    return shuffled;
  }
}