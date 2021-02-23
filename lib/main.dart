import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";


  operation(String btntext) {
    if (btntext == "C") {
      _output = "0";
      num2 = 0.0;
      num1 = 0.0;
      operand = "";

    }
    else
    if (btntext == "+" || btntext == "-" || btntext == "/" || btntext == "/") {
      num1 = double.parse(output);
      operand = btntext;
      _output = "0";
    }
    else if (btntext == "=") {
      num2 = double.parse(output);
      operand = btntext;
    }
    if (operand == "+") {
      _output = (num1 + num2).toString();
    }
    if (operand == "-") {
      _output = (num1 - num2).toString();
    }
    if (operand == "/") {
      _output = (num1 / num2).toString();
    }
    if (operand == "X") {
      _output = (num1 * num2).toString();
    }
    num1 = 0.0;
    num2 = 0.0;
    operand = "";
  }
  else{
    _output = _output + btntext;
  }
  setState(() {
    output = double.parse(_output).toStringAsFixed(2);
  }
}


  Widget Button(String btntext) {
    return Expanded(
        child: RawMaterialButton(
            splashColor: Colors.white,
            fillColor: Colors.blueGrey,
            shape: Border.all(color: Colors.black, width: 1),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("$btntext",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  )),

            ),
            onPressed: () {
              operation(btntext);
            }
        ));
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.cyan,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.black12,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text("$output",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,

                      ),),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                    children: [
                      Button("9"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("8"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("7"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("/"),
                      SizedBox(
                        width: 5,

                      ),
                    ]
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                    children: [
                      Button("6"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("5"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("4"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("x"),
                      SizedBox(
                        width: 5,

                      ),
                    ]
                ),
              ),
              SizedBox(
                height: 5,

              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                    children: [
                      Button("3"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("2"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("1"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("+"),
                      SizedBox(
                        width: 5,

                      ),
                    ]
                ),
              ),
              SizedBox(
                height: 5,

              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: Row(

                    children: [
                      Button("0"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("C"),
                      SizedBox(
                        width: 5,

                      ),
                      Button("="),
                      SizedBox(
                        width: 5,

                      ),
                      Button("-"),
                      SizedBox(
                        width: 5,

                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
