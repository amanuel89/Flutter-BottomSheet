import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bottomsheet/widgets/task_column.dart';
import 'package:bottomsheet/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: 300.0,
            decoration: BoxDecoration(
                color: LightColors.kLightYellow2,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                TaskColumn(
                  icon: Icons.alarm,
                  iconBackgroundColor: LightColors.kRed,
                  title: 'To Do',
                  subtitle: '5 tasks now. 1 started',
                ),
                SizedBox(
                  height: 15.0,
                ),
                TaskColumn(
                  icon: Icons.blur_circular,
                  iconBackgroundColor: LightColors.kDarkYellow,
                  title: 'In Progress',
                  subtitle: '1 tasks now. 1 started',
                ),
                SizedBox(height: 15.0),
                TaskColumn(
                  icon: Icons.check_circle_outline,
                  iconBackgroundColor: LightColors.kBlue,
                  title: 'Done',
                  subtitle: '18 tasks now. 13 started',
                ),
                SizedBox(height: 15.0),
                TaskColumn(
                  icon: Icons.alarm,
                  iconBackgroundColor: LightColors.kRed,
                  title: 'Meetings',
                  subtitle: '5 tasks now. 1 started',
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            decoration: BoxDecoration(
                color: LightColors.kLightYellow2,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            padding: EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 10.0),
            height: 300.0,
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: IconButton(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        icon: Icon(Icons.account_circle, size: 48.0),
                        onPressed: () {}),
                    title: Text('Username',
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(fontWeight: FontWeight.w500)),
                    subtitle: Text("username@gmail.com"),
                    onTap: () {}),
                Divider(),
                ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Feedback'),
                    onTap: () {}),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("BottomSheet"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
            child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size(100, 100), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // button color
                  child: InkWell(
                    splashColor: Colors.green, // splash color
                    onTap: _showPersBottomSheetCallBack, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[ // icon
                        Text("Persistent",style: TextStyle(color: Colors.white),), // text
                      ],
                    ),
                  ),
                ),
              ),
            ),
           /* new RaisedButton(
              onPressed: _showPersBottomSheetCallBack,
              child: new Text("Persistent"),
            ),*/
            new Padding(
              padding: const EdgeInsets.only(left: 30.0),
            ),
            SizedBox.fromSize(
              size: Size(100, 100), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // button color
                  child: InkWell(
                    splashColor: Colors.green, // splash color
                    onTap: _showModalSheet, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[ // icon
                        Text("Modal",style: TextStyle(color: Colors.white),), // text
                      ],
                    ),
                  ),
                ),
              ),
            ),
           /* new RaisedButton(
              onPressed: _showModalSheet,
              child: new Text("Modal"),
            ),*/
          ],
        )),
      ),
    );
  }
}
