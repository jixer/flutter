import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

final kIosTheme = new ThemeData(
  primarySwatch: Colors.blue
);

final kDefaultTheme = new ThemeData(
  primarySwatch: Colors.orange
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: isIos(context) ? kIosTheme : kDefaultTheme,
      home: new MyHomePage(title: 'Platform Themes'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: new Column(
          children: <Widget>[
            new Center(
              child: new Text(getButtonText(context)),
            ),
            isIos(context) 
              ? new CupertinoButton(
                child: new Text('Click Me!'),
                onPressed: () {},
              )
              : new MaterialButton(
                child: new Text('Click Me!'),
                onPressed: () {},
              ),
              new Divider(),
              new Center(
                child: new Text(getSwitchText(context)),
              ),
              isIos(context)
                ? new CupertinoSwitch(
                  value: true,
                  onChanged: (bool x) {}
                )
                : new Switch(
                  value: true,
                  onChanged: (bool x) {},
                )
          ],
        )
      );
    }
                
    String getButtonText(BuildContext context) {
      return isIos(context) ? 'This is a Cuptertino Button' : 'This is a Material Design Button';
    }
  
    String getSwitchText(BuildContext context) {
      return isIos(context) ? 'This is a Cuptertino Switch' : 'This is a Material Design Switch';
    }
}

bool isIos(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.iOS;
}