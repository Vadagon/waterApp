import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({this.user, this.cb});
  final dynamic user;
  final Function cb;

  @override
  HomeState createState() => HomeState(user, cb);
}

class HomeState extends State<HomeRoute> {
  Map user;
  Function cb;
  HomeState(this.user, this.cb);

  @override
  initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    if (_counter > 5) {
      Navigator.pushNamed(context, "/setup");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123123'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
