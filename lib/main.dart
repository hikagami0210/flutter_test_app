import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_apps/janken_app.dart';
import 'package:test_apps/layouttest.dart';
import 'package:test_apps/listview.dart';
import 'package:test_apps/prime_check.dart';
import 'package:test_apps/tab_view.dart';

import 'SpeakToText.dart';
import 'bookshelf.dart';
import 'memo.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Column(children: <Widget>[
        pageButton('じゃんけんゲーム', Janken_app(), context),
        pageButton("bookshelf", const BookshelfScreen(), context),
        pageButton("メモ shared_preferences使用", const memo(), context),
        pageButton("レイアウトテスト", layout(), context),
        pageButton("ListView", const listview(), context),
        pageButton("Tabview", const Tabview(), context),
        pageButton("Speech to text", const SpeakToText(), context),
        pageButton("素数判定", const Prime(), context)
      ]),
    );
  }

  Widget pageButton(String title, route , context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => route,
                    ));
              },
              child: (Text(title,
                style: const TextStyle(fontSize: 20),
              )))),
    );
  }
}
