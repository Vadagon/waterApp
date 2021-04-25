import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'db.dart';

import 'pages/home/home.dart';
import 'pages/setup/setup.dart';
import 'themeData.dart';

Map user = {};

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

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
      theme: appTheme,
      initialRoute: user['setupIsFinished'] ? '/' : '/setup',
        
      routes: {
        '/': (context) => HomeRoute(user: user, cb: cb),
        '/setup': (context) => SetupRoute(user: user, cb: cb),
      },
    );
  }
}
