import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('クイズアプリ')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizScreen()),
            );
          },
          child: const Text('スタート', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
