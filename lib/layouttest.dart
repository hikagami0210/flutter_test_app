import 'package:flutter/material.dart';

class layout extends StatelessWidget {
  layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;



    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body:
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: screenSize.height * 0.3,
            width: screenSize.width * 1,
            color: Colors.blue,
            child: Column(
              children: [
                Expanded(flex:2,child: Container(
                  height: double.infinity,
                  color: Colors.cyan,
                  child: const Text("今日のおすすめ",style: TextStyle(
                    fontSize: 30,
                  ),),
                )),
                Expanded(flex:8,child: Container(
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Expanded(flex:4,child: Container(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          color: Colors.red,
                        ),
                      )),
                      Expanded(flex:3,child: Container(
                        margin: const EdgeInsets.fromLTRB(0,20,0,20),
                        child: Column(
                          children: [
                            Expanded(flex:2,child: Container(
                              color: Colors.red,
                            )),
                            Expanded(flex:6,child: Container(
                              color: Colors.white,
                              margin: EdgeInsets.all(10),
                            )),

                          ],
                        ),
                      ))
                    ],
                  ),
                )),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
