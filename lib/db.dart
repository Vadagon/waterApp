// import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast.dart';

// import 'dart:convert';

class DB {
  Map user = {
    'stats': {'today': {}, 'drunk': 0, 'lastDay': 0},
    'quota': 1700,
    'wakeTime': ['8:00', '23: 00'],
    'bodyShape': 'regular',
    'weight': '65',
    'age': '25',
    'gender': 'female',
    'remindFrequency': '60', // minutes
    'setupIsFinished': false
  };
  var store = StoreRef.main();

  void getData(Function cb) async {
    print(dayToday());

    var db = await getDB();

    var userRecord = await store.record('user').get(db) as Map;
    if (userRecord == null) {
      user['stats'][dayToday().toString()] = {'ml': 0};
      store.record('user').put(db, user);
      return cb(user);
    }
    user = userRecord;

    cb(user);
  }

  void updateUser(Map _data) async {
    user = _data;
    var db = await getDB();
    store.record('user').put(db, user);
  }

  Future getDB() async {
    var appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = appDocDir.path + '/main.db';
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbPath);

    return db;
  }

  Future<Map> deleteAllData() async {
    var db = await getDB();
    store.record('user').put(db, user);
    return user;
  }

  dynamic dayToday() {
    var now = DateTime.now().millisecondsSinceEpoch;
    var fullDaysSinceEpoch = (now / 8.64e7).floor();
    return fullDaysSinceEpoch;
  }
}
