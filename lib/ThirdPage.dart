import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ページ(3)"),
        backgroundColor: Colors.teal, // アプリバーの背景色を変更
      ),
      body: Container(
        decoration: BoxDecoration(
          // 背景にグラデーションを設定
          gradient: LinearGradient(
            colors: [Colors.teal.shade200, Colors.teal.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // ボタンの背景色を白に設定
              foregroundColor: Colors.teal, // ボタンのテキスト色を緑に設定
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // 角を丸くする
              ),
              elevation: 5, // ボタンに影を追加
            ),
            child: Text(
              "最初のページに遷移する",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // 最初のページに戻る
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ),
      ),
    );
  }
}
