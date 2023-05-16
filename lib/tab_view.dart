import 'package:flutter/material.dart';
import 'package:test_apps/listview.dart';

class Tabview extends StatelessWidget {
  const Tabview({Key? key}) : super(key: key);

  TabBar get _tabBar => const TabBar(
    tabs: [
      Tab(icon: Icon(Icons.flight)),
      Tab(icon: Icon(Icons.directions_transit)),
      Tab(icon: Icon(Icons.directions_car)),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Tab Bar Test"),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Colors.blue, //<-- SEE HERE
                child: _tabBar,
              ),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: const TabBarView(
            children: <Widget>[
              listview(),
              Center(child: Text('雨', style: TextStyle(fontSize: 50))),
              Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
            ],
          ),
        ),
      ),
    );
  }
}