import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'db.dart';

import 'pages/home/home.dart';
import 'pages/setup/setup.dart';

Map user = {};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  DB().getData((Map _user) {
    user = _user;
    print(user);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  void cb(Map _user) {
    user = _user;
    DB().updateUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
         textTheme: TextTheme(
      headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold,color: Color(0xffffffff)),
      headline6: TextStyle(fontSize: 16.0, ),
      bodyText2: TextStyle(fontSize: 14.0, ),
      caption: TextStyle(fontSize: 24.0, color: Color(0xff222222), fontWeight: FontWeight.bold,),
    ),
      ),
      initialRoute: '/setup',
      routes: {
        '/': (context) => HomeRoute(user: user, cb: cb),
        '/setup': (context) => SetupRoute(user: user, cb: cb),
      },
    );
  }
}
