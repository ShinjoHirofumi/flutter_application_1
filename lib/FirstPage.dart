import 'package:flutter/material.dart';
import 'package:flutter_application_1/SecondPage.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ページ(1)"),
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
              "２ページ目に遷移する",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // （1） 指定した画面に遷移する
              Navigator.push(
                context,
                MaterialPageRoute(
                  // （2） 実際に表示するページ(ウィジェット)を指定する
                  builder: (context) => SecondPage(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
