import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Prime extends StatefulWidget {
  const Prime({Key? key}) : super(key: key);

  @override
  State<Prime> createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {

  int num = 0;
  int sss = 0;
  int aa = 0;
  String isprime = "Null";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("かんたん素数判定",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black26),),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                maxLength: 19,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (v){
                  setState(() {
                    num = int.parse(v);
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.black26,
                  filled: true,
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: ()async{
              showProgressDialog();
              // await Future.delayed(const Duration(seconds: 1));
              isPrime(num);
              Navigator.of(context).pop();
              setState(() {
              });
            }, child: const Text("判定！")),

            primeCard(),
          ],
        ),
      ),
    );
  }

  isPrime(num) {
    if(num >= 9000000000000000000){
      setState(() {
        isprime = "error";
      });
      return;
    }
    setState(() {
      aa = num;
    });
    if (num <= 1) {
      setState(() {
        isprime = "false";
      });
      return;
    }
    int a = num;
    int b = num;

    int base = sqrt(a).toInt() + 1;

    for(int i = base ; i >= 2;i--){
      if(a % i == 0){
        print(i.toString() + "sss");
        setState((){
          isprime = "false";
          sss = i;
        });
        print(a);
        return;
      }
    }

    setState(() {
      isprime = "true";
    });

  }

  Widget primeCard(){
    if(isprime == "Null"){
      return SizedBox.shrink();
    }else if(isprime == "true"){
      return Text("$aaは素数です");
    }else if(isprime == "error"){
      return Column(
        children: [
          Text("数字が大きすぎます"),
          Text("9000000000000000000以下の数字で試してください")
        ],
      );
    }else{
      return Column(
        children: [
          Text("$aaは素数ではありません"),
          Text("$sssで割り切れました")
        ],
      );
    }
  }
  void showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
