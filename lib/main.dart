import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator> {
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  void Sum() {
    //Validate form
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA  + $numberB = $result";
      });
    }
  }

  void Minus() {
    //Validate form
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA  - $numberB = $result";
      });
    }
  }

  void Multiply() {
    //Validate form
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA  * $numberB = $result";
      });
    }
  }

  void Divide() {
    //Validate form
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA  / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
        key: my_form_key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                controller: controller_numberA,
                validator: (value) {
                  if (value.isEmpty) return "Please enter number";
                },
                decoration: InputDecoration(hintText: "Enter number"),
                keyboardType: TextInputType.number),
            TextFormField(
                controller: controller_numberB,
                validator: (value) {
                  if (value.isEmpty) return "Please enter number";
                },
                decoration: InputDecoration(hintText: "Enter number"),
                keyboardType: TextInputType.number),
            Text(
              textToShow,
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: Sum,
                  child: Text('+'),
                ),
                RaisedButton(
                  onPressed: Minus,
                  child: Text('-'),
                ),
                RaisedButton(
                  onPressed: Multiply,
                  child: Text('*'),
                ),
                RaisedButton(
                  onPressed: Divide,
                  child: Text('/'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
