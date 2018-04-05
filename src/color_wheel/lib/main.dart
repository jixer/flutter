import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ColorWheelApp extends StatefulWidget {
  _ColorWheelState createState() => new _ColorWheelState();
}

class _ColorWheelState extends State<ColorWheelApp>
    with TickerProviderStateMixin {
  // define variables
  AnimationController controller;
  Animation<double> animation;
  ColorTween _colorTweenOne;
  ColorTween _colorTweenTwo;
  ColorTween _colorTweenThree;
  ColorTween _colorTweenFour;
  List<MaterialColor> colorWheel = [
    Colors.blue,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.grey,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.white,
    Colors.yellow
  ];

  initState() {
    // initialize tween variables
    _colorTweenOne = new ColorTween(begin: colorWheel[0], end: colorWheel[1]);
    _colorTweenTwo = new ColorTween(begin: colorWheel[1], end: colorWheel[2]);
    _colorTweenThree = new ColorTween(begin: colorWheel[2], end: colorWheel[3]);
    _colorTweenFour = new ColorTween(begin: colorWheel[3], end: colorWheel[4]);

    super.initState();
    // set up animation controller
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    animation.addListener(() {
      setState(() {
        // the state that has changed here is the animation object’s value
      });
    });

    // set up animation status listener
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("$status");
        rotateColors();
        controller.reset();
        controller.forward();
      }
    });

    // kick off initial animation
    controller.forward();
  }

  rotateColors() {
    // rotate the color wheel forward
    var replacementColorWheel = new List.from(colorWheel);
    for (var i = 0; i < colorWheel.length; i++) {
      if (i == colorWheel.length - 1) {
        replacementColorWheel[i] = colorWheel[0];
      } else {
        replacementColorWheel[i] = colorWheel[i + 1];
      }
    }

    // replace the colorWheel with the color wheel that is rotated forward
    colorWheel = replacementColorWheel;

    // update the tween transitions
    _colorTweenOne.begin = colorWheel[0];
    _colorTweenOne.end = colorWheel[1];
    _colorTweenTwo.begin = colorWheel[1];
    _colorTweenTwo.end = colorWheel[2];
    _colorTweenThree.begin = colorWheel[2];
    _colorTweenThree.end = colorWheel[3];
    _colorTweenFour.begin = colorWheel[3];
    _colorTweenFour.end = colorWheel[4];
  }

  Widget build(BuildContext context) {
    //return new AnimatedLogo(animation: animation);
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "Animation Demo",
              style: new TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: new Stack(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Expanded(
                      flex: 1,
                      child: new Container(
                          color: _colorTweenOne.evaluate(animation))),
                  new Expanded(
                      flex: 1,
                      child: new Container(
                          color: _colorTweenTwo.evaluate(animation))),
                  new Expanded(
                      flex: 1,
                      child: new Container(
                          color: _colorTweenThree.evaluate(animation))),
                  new Expanded(
                      flex: 1,
                      child: new Container(
                          color: _colorTweenFour.evaluate(animation))),
                ],
              ),
              new Center(
                child: new Text(
                  "Hello Animations!",
                  style: new TextStyle(
                      fontSize: 40.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(new ColorWheelApp());
}
