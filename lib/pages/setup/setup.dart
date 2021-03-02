import 'package:flutter/material.dart';

class SetupRoute extends StatefulWidget {
  SetupRoute({this.user, this.cb});
  final dynamic user;
  final Function cb;

  @override
  SetupState createState() => SetupState(user, cb);
}

class SetupState extends State<SetupRoute> {
  Map user;
  Function cb;
  SetupState(this.user, this.cb);

  @override
  initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2nd screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        tooltip: 'Prev',
        child: Icon(Icons.skip_previous),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
