import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator Comparison Demo',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: new MyHomePage(title: 'Flutter Calculator Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentState = 1;
  var mathOperator = "";
  double firstNumber, secondNumber;
  String resultText = "0";

  void _onCalculate() {
    if (currentState == 2) {
      double result = 0.0;

      switch (mathOperator) {
        case "/":
          result = firstNumber / secondNumber;
          break;
        case "X":
          result = firstNumber * secondNumber;
          break;
        case "+":
          result = firstNumber + secondNumber;
          break;
        case "-":
          result = firstNumber - secondNumber;
          break;
      }

      resultText = result.toString();
      firstNumber = result;
      currentState = -1;

      setState(() {});
    }
  }

  void _onSelectOperator(String pressed) {
    currentState = -2;
    mathOperator = pressed;

    setState(() {});
  }

  void _onClear() {
    firstNumber = 0.0;
    secondNumber = 0.0;
    currentState = 1;
    resultText = "0";

    setState(() {});
  }

  void _onSelectOne(String pressed) {
    if (resultText == "0" || currentState < 0) {
      resultText = "";
      if (currentState < 0) 
        currentState *= -1;
    }

    resultText += pressed;

    if (currentState == 1) {
      firstNumber = double.parse(resultText);
    } else {
      secondNumber = double.parse(resultText);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator Demo"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text('$resultText',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                color: Colors.black,
              ),
              flex: 2,
            ),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("7", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("7"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("8", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("8"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("9", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("9"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child: new Text("/",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 36.0)),
                      color: Colors.orange,
                      onPressed: () => _onSelectOperator("/"),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("4", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("4"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("5", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("5"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("6", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("6"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child: new Text("X",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 36.0)),
                      color: Colors.orange,
                      onPressed: () => _onSelectOperator("X"),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("1", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("1"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("2", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("2"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("3", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("3"),
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child: new Text("-",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 36.0)),
                      color: Colors.orange,
                      onPressed: () => _onSelectOperator("-"),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      child:
                          new Text("0", style: new TextStyle(fontSize: 36.0)),
                      color: Colors.white,
                      onPressed: () => _onSelectOne("0"),
                    ),
                    flex: 3,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child: new Text("+",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 36.0)),
                      color: Colors.orange,
                      onPressed: () => _onSelectOperator("+"),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      child: new Text("C",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 36.0)),
                      color: Colors.grey,
                      onPressed: _onClear,
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new RaisedButton(
                      child: new Text("=",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 36.0)),
                      color: Colors.orange,
                      onPressed: _onCalculate,
                    ),
                    flex: 3,
                  ),
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
