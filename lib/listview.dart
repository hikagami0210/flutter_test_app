
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

List <String> testList = ['A', 'B', 'C','D','E','F','G','H','I','J','K','L',"M","N","O","P","Q","R","S","T","U","V"];

class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  final prefs = SharedPreferences.getInstance();

  int _counter = 0;

  String ok = "no";

  List <int> kosu = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

  @override
  void initState(){
    super.initState();
    Future(()async{
      _counter = 0;
      final prefs = await SharedPreferences.getInstance();
      setState((){
        kosu.clear();
        for (var i = 0; i <= testList.length -1 ; i++) {
          if (prefs.getInt(testList[i]) == 0) {
            prefs.setInt(testList[i], 0);
            kosu.add(0);
          } else {
            _counter = prefs.getInt(testList[i]) ?? 0;
            kosu.add(_counter);
          }
        }
        print("-----------------------------------");
        print(kosu.length);
        print("-----------------------------------");
      });
    }
    );
  }
  
  int decrement(int index){
    return index -1;
  }

  int increment(int index){
    return index +1;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: testList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                                child: Text(
                              testList.elementAt(index),
                              textAlign: TextAlign.center,
                            )),
                          )),
                      Expanded(flex: 3, child: Container()),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      _setPlefItem()async{
                                        final prefs = await SharedPreferences.getInstance();
                                        prefs.setInt(testList[index], kosu[index]);
                                      }
                                      setState(() {
                                        if(kosu[index] != 0){
                                          kosu[index] = decrement(kosu[index]);
                                          _setPlefItem();
                                        }else{

                                        }

                                      });

                                    },
                                    icon: const Icon(Icons.remove,
                                        color: Colors.black)),
                                Text(kosu[index].toString()),
                                IconButton(
                                    onPressed: () {
                                      _setPlefItem()async{
                                        final prefs = await SharedPreferences.getInstance();
                                        prefs.setInt(testList[index], kosu[index]);
                                      }
                                      setState(() {
                                          kosu[index] = increment(kosu[index]);
                                          _setPlefItem();
                                          print(kosu);
                                          print(kosu.length);
                                          print(testList.length);
                                      });
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.black)),
                              ],
                            ),
                          )),
                      Expanded(flex: 3, child: Container()),
                    ],
                  ),
                ),
              );
            }));

  }
}

