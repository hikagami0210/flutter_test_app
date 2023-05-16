import 'dart:math' as math;

import 'package:flutter/material.dart';

class Janken_app extends StatelessWidget {
  const Janken_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Janken APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int answerNumber = 4;
  String jankenText = 'これからじゃんけんします';
  String jankenImage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // スペースを追加
            const Spacer(),
            Expanded(child: image(jankenImage)),
            // スペースを追加
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(jankenText,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              // 横幅いっぱいを指定
              width: double.infinity,
              // 高さ100
              height: 100,
              // [じゃんけんをする！]ボタン
              child: ElevatedButton(
                // 背景をピンクに指定
                onPressed: () {
                  // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                  int newAnswerNumber = 0;
                  // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                  // do {} while は繰り返しを意味する
                  do {
                    // 0,1,2の数値をランダムに算出（乱数）
                    newAnswerNumber = math.Random().nextInt(3);
                    // 前回と同じ結果のときは、再度、ランダムに数値を出す
                    // 異なる結果のときは、while を抜ける
                  } while (answerNumber == newAnswerNumber);
                  // 新しいじゃんけんの結果を格納
                  answerNumber = newAnswerNumber;
                  setState(() {
                    if (answerNumber == 0) {
                      // じゃんけんの数字が0だったら、グー画像を指定
                      jankenImage = 'images/gu.png';
                      jankenText = 'グー';
                    } else if (answerNumber == 1) {
                      // じゃんけんの数字が1だったら、チョキ画像を指定
                      jankenImage = 'images/choki.png';
                      jankenText = 'チョキ';
                    } else if (answerNumber == 2) {
                      // じゃんけんの数字が2だったら、パー画像を指定
                      jankenImage = 'images/pa.png';
                      jankenText = 'パー';
                    }
                  });
                },
                // Buttonに表示する文字を指定
                child: const Text('じゃんけんをする！',
                    style: TextStyle(
                      // 文字サイズを指定
                      fontSize: 30,
                      // 文字色を白に指定
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget image(String image) {
  if (image.isEmpty) {
    // 画像のファイル名がない場合には、Container()を返して何も表示しない
    return Container();
  } else {
    // 指定された画像ファイル名を表示する
    return Image.asset(
      image,
    );
  }
}
