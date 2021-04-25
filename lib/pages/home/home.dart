import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
// ignore: unused_import
import 'hints.dart';
import 'overlaySlider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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
  GlobalKey _key = GlobalKey();
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();
  GlobalKey _key4 = GlobalKey();

  HomeState(this.user, this.cb);

  double btnHeight = 46;
  var todayDrunked = 0;
  double persentFillBar;
  double avatarBarHeight;
  Map<String, dynamic> drinkHistory = {};
  var persentPointOnBar;
  Map data;

  @override
  initState() {
    data = jsonDecode(jsonEncode(user));
    print(data);

    tz.initializeTimeZones();
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    var dayOfTheMonth = now.day;
    if (data['stats']['lastDay'] != dayOfTheMonth) {
      data['stats'] = {
        'today': drinkHistory,
        'drunk': 0,
        'lastDay': dayOfTheMonth
      };
      cb(data);
    }

    todayDrunked = data['stats']['drunk'];
    drinkHistory = data['stats']['today'];

    // num dailyQuota = waterCalculator(user);
    // todayDrunked = 0;
    // drinkHistory = {};
    // print(user['quota']);
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    Size contextSize = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    avatarBarHeight = contextSize.height / 1.5 - padding.bottom - padding.top;
    double filledStatusBar = (todayDrunked / user['quota']) * 100;
    persentFillBar = (avatarBarHeight * filledStatusBar) / 100;
    double heightWithoutBody =
        (contextSize.height - padding.bottom - padding.top - avatarBarHeight) /
            2;
    if (persentFillBar > avatarBarHeight) {
      persentFillBar = avatarBarHeight;
    }
    // 250, 560, 700 в масиві це хвилини а 200, 300, 100 це мілілітри
    // DONE: display drinkHistory in the Right Side Bar

    return Scaffold(
      backgroundColor: Color(0xFF1B61CB),
      body: Container(
        width: contextSize.width,
        height: contextSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [
              0.0,
              0.8,
            ],
            colors: [
              Color(0xff00D7CA),
              Color(0xcff1B61CB),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // HINT
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                height: heightWithoutBody,
                // color:Colors.red,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: SvgPicture.asset(
                                'assets/img/bulb.svg',
                              ),
                              tooltip: 'hint',
                              onPressed: () {}),
                          Hint(),
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/img/settings.svg',
                            ),
                            tooltip: 'Settings',
                            onPressed: () {
                              Navigator.pushNamed(context, '/setup');
                            },
                          ),
                        ],
                      ),
                    ),
                    // APP BAR ICONS
                  ],
                ),
              ),
              // BODY
              Container(
                // color:Colors.green,
                height: avatarBarHeight,
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(''),
                    // AVATAR
                    Container(
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                persentPointOnBar != null
                                    ? persentPointOnBar / 100
                                    : 0,
                                persentPointOnBar != null
                                    ? persentPointOnBar / 100
                                    : 0,
                              ],
                              colors: [
                                Color(0xffffffff),
                                Color(0xff42D8F9),
                              ],
                              tileMode: TileMode.clamp,
                            ).createShader(bounds),
                            child: SvgPicture.asset(
                              user['gender'] == 'male'
                                  ? 'assets/img/avatar2.svg'
                                  : 'assets/img/avatar.svg',
                              height: avatarBarHeight - 30,
                            ),
                          ),
                          Text(
                            '$todayDrunked/${user['quota']}',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    // WATERBAR
                    AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      width: 50,
                      height: avatarBarHeight,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          // TEXT
                          _generateDrinks(false),
                          // BAR
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceOut,
                            left: 33,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.bounceOut,
                              clipBehavior: Clip.antiAlias,
                              width: 17,
                              height: avatarBarHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x40000000),
                                      offset: Offset(2, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0)
                                ],
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Stack(
                                children: [
                                  AnimatedPositioned(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.bounceOut,
                                    bottom: 0,
                                    height: persentFillBar,
                                    width: 17,
                                    left: 0,
                                    child: Container(
                                      color: Color(0xA668C4FB),
                                      child: _generateDrinks(true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom buttons
              Container(
                height: heightWithoutBody,
                // color:Colors.red,

                padding: EdgeInsets.only(left: 45, right: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: contextSize.width / 8,
                      height: contextSize.width / 8,
                      key: _key,
                      child: btnAddWater(
                        context,
                        _getPositions,
                        _key,
                        'water',
                      ),
                    ),
                    Container(
                      width: contextSize.width / 8,
                      height: contextSize.width / 8,
                      key: _key1,
                      child: btnAddWater(
                        context,
                        _getPositions,
                        _key1,
                        'milk',
                      ),
                    ),
                    Container(
                      width: contextSize.width / 8,
                      height: contextSize.width / 8,
                      key: _key2,
                      child: btnAddWater(
                        context,
                        _getPositions,
                        _key2,
                        'tea',
                      ),
                    ),
                    Container(
                      width: contextSize.width / 8,
                      height: contextSize.width / 8,
                      key: _key3,
                      child: btnAddWater(
                        context,
                        _getPositions,
                        _key3,
                        'coffee',
                      ),
                    ),
                    Container(
                      width: contextSize.width / 8,
                      height: contextSize.width / 8,
                      key: _key4,
                      child: btnAddWater(
                        context,
                        _getPositions,
                        _key4,
                        'juice',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getBarData(ml) {
    DateTime now = DateTime.now();
    var dayStartTime =
        ((((now.hour * 60) + (now.minute)) * 60) + now.second).round();
    setState(() {
      todayDrunked += ml;
      print('dayStartTime');
      print(dayStartTime);
      drinkHistory.addAll({dayStartTime.toString(): ml});

      data['stats']['drunk'] = todayDrunked;
      data['stats']['today'] = drinkHistory;
      cb(data);
      // ADD TIME AND ML TO HISTORI
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {});
    });
  }

  String _printDuration(
    Duration duration,
  ) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }

  Widget _generateDrinks(bool type) {
    // GENERATE LIST OF POINTS POSITION VALUE
    dynamic persentPointOnBarArray = {};
    var a = 0;
    drinkHistory.forEach((k, v) {
      String timeBarText = (_printDuration(Duration(seconds: int.parse(k))));

      a += v;
      persentPointOnBar = (a / user['quota']) * 100;
      persentPointOnBarArray.addAll({persentPointOnBar: timeBarText});
    });
    // GENERATE LIST OF WIDGETS
    List<Widget> list = [];
    List<String> listV = [];
    int index = 0;
    int indexWhenBarFilled;
    persentPointOnBarArray.forEach((k, v) {
      var posPoint = (avatarBarHeight * (k) / 100);
      index++;
      listV.add(v);

      if (avatarBarHeight < posPoint) {
        posPoint = avatarBarHeight;
        indexWhenBarFilled = index;
        print(index);
        list.removeAt(2);
      }

      print(indexWhenBarFilled);
      list.add(
        AnimatedPositioned(
          key: UniqueKey(),
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          bottom: avatarBarHeight == posPoint ? avatarBarHeight - 10 : posPoint,
          child: type
              ? AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceOut,
                  width: 17,
                  height: avatarBarHeight == posPoint ? 10 : 2,
                  color: Colors.white,
                )
              : Container(
                  child: Text(
                    avatarBarHeight == posPoint ? listV[listV.length - 1] : v,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        ),
      );
      setState(() {
        print(list);
      });
    });

    return new Stack(children: list);
  }

  dynamic _getPositions(keyS) {
    final RenderBox renderDrop = keyS.currentContext.findRenderObject();
    final positionDrop = renderDrop.localToGlobal(Offset.zero);
    double y = positionDrop.dy;
    double x = positionDrop.dx;
    // print("POSITION of renderDrop: $y ");
    // print("POSITION of renderDrop: $x ");
    return [x, y];
  }

  RawMaterialButton btnAddWater(
    BuildContext context,
    dynamic _getPositions,
    Key keyS,
    String drinkName,
  ) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      onPressed: () {
        print(drinkName);
        showOvarlay(context, _getPositions(keyS), _getBarData, drinkName);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: SvgPicture.asset(
        'assets/img/$drinkName.svg',
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }
}
