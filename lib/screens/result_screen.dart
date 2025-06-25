import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // AnswerRecord を使うために必要

class ResultScreen extends StatelessWidget {
  final int score;
  final List<AnswerRecord> answerRecords;

  const ResultScreen({
    super.key,
    required this.score,
    required this.answerRecords,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('結果')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'あなたのスコア: $score',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...answerRecords.map((record) {
              return Card(
                color: record.isCorrect ? Colors.green[100] : Colors.red[100],
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('問題: ${record.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('あなたの答え: ${record.selectedAnswer}'),
                      Text('正解: ${record.correctAnswer}'),
                      Text(
                        record.isCorrect ? '◯ 正解' : '✕ 不正解',
                        style: TextStyle(
                          color: record.isCorrect ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('タイトルに戻る', style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
