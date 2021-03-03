import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
          String output = "0";
          String _output = "0";
          int num1 = 0;
        int num2 = 0;
          String operand = "";

          operation(String btnText ){
            if(btnText=="C"){
              _output = "0";
               num1 = 0;
               num2 = 0;
               operand = "";
            }
            else if (btnText=="/"||btnText=="+"||btnText=="x"||btnText=="-"){
              num1 = int.parse(_output);
              operand =btnText;
              _output = "0";
            }
            else if (btnText=="="){
              num2= int.parse(output);
              if(operand== "+"){
                _output= (num1 + num2).toString();
              }
              if(operand== "-"){
                _output= (num1 - num2).toString();
              }
              if(operand== "/"){
                _output= (num1 / num2).toString();
              }
              if(operand== "x"){
                _output= (num1 * num2).toString();
              }
              num1 = 0;
              num2 = 0;
              operand = "";
            }
            else{
              _output = _output + btnText;
            }
            setState(() {
              output = int.parse(_output).toStringAsFixed(1);
            });
          }

  Widget button(String btnText){
    return Expanded(
        child: RawMaterialButton(
          shape: Border.all(color: Colors.black, width: 2),
          padding: const EdgeInsets.all(30.0),
          splashColor: Colors.white,

          child: Text("$btnText",
            style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),),
          fillColor: Colors.blue,
          onPressed: (){
            operation(btnText);
          },
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.blue,
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
                    padding: const EdgeInsets.all(30.0),
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text("$output",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,

                      ),),
                  )),
              
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
                 children: [
                  button("9"),
                    SizedBox(
                  width: 5,),
                  button("8"),
                   SizedBox(
                  width: 5,),
                  button("7"),
                  SizedBox(
                width: 5,),
                  button("/"),
                  SizedBox(
                width: 5,),
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
              button("6"),
              SizedBox(
                width: 5,

              ),
              button("5"),
              SizedBox(
                width: 5,

              ),
              button("4"),
              SizedBox(
                width: 5,

              ),
              button("x"),
              SizedBox(
                width: 5,

              ),
            ]
        ),
      ),
            SizedBox(
           height: 5,
         ),
            Padding(padding: const EdgeInsets.only(left: 8.0),
              child: Row(
              children: [
                button("3"),
                SizedBox(
                width: 5,

              ),
                button("2"),
                SizedBox(
                width: 5,

              ),
                button("1"),
                SizedBox(
                width: 5,

              ),
                button("+"),
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
                 button("0"),
                 SizedBox(
              width: 5,

            ),
                button("C"),
                SizedBox(
              width: 5,

            ),
                button("="),
               SizedBox(
              width: 5,

            ),
                button("-"),
               SizedBox(
              width: 5,

            ),
               ],
              ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
