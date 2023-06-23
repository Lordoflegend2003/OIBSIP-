import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(95, 0, 0, 0)),
        
      ),
      home: const HomePage(title: 'Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<HomePage> {
  String res = '';
  String text = '';
  late String op;
  late int first;
  late int second;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(widget.title , style: const TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 121, 121, 121))),
        titleSpacing: 140,
        toolbarHeight: 70.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 70.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                cusOutlinebtn("9"),
                cusOutlinebtn("8"),
                cusOutlinebtn("7"),
                cusOutlinebtn("+"),
              ],
            ),
            Row(
              children: <Widget>[
                cusOutlinebtn("6"),
                cusOutlinebtn("5"),
                cusOutlinebtn("4"),
                cusOutlinebtn("-"),
              ],
            ),
            Row(
              children: <Widget>[
                cusOutlinebtn("3"),
                cusOutlinebtn("2"),
                cusOutlinebtn("1"),
                cusOutlinebtn("x"),
              ],
            ),
            Row(
              children: <Widget>[
                cusOutlinebtn("c"),
                cusOutlinebtn("0"),
                cusOutlinebtn("="),
                cusOutlinebtn("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cusOutlinebtn(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclicked(val),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            val,
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 174, 174, 174),
            ),
          ),
        ),
      ),
    );
  }

  void btnclicked(String bttext) {

    if (bttext == "c") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    }
     else if (bttext == "+" || bttext == '-' || bttext == "/" || bttext == "x") {
      first = int.parse(text);
      res = "";
      op = bttext;
    }
    
     else if (bttext == "=") {
      second = int.parse(text);

      if (op == "+") {
        res = (first + second).toString();
      }

      if (op == "-") {
        res = (first - second).toString();
      }

      if (op == "x") {
        res = (first * second).toString();
      }

      if (op == "/") {
        res = (first ~/ second).toString();
      }
    } 
    else {
      res = int.parse(text + bttext).toString();
    }

    setState(() {
      text = res;
    });
  }
}