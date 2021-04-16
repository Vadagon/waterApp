import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'overlaySlider.dart';

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
  // GlobalKey _key1 = GlobalKey();

  @override
  initState() {
    print(user);

    // num dailyQuota = waterCalculator(user);
    // print(user['quota']);
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  double btnHeight = 46;
  var todayDrunked = 0;
  double persentFillBar;
  double avatarBarHeight;
  var drinkHistory = {250: 100, 560: 300, 700: 140};

  @override
  Widget build(BuildContext context) {
    Size contextSize = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    avatarBarHeight = contextSize.height / 1.8 - padding.bottom - padding.top;
    double filledStatusBar = (todayDrunked / user['quota']) * 100;
    persentFillBar = (avatarBarHeight * filledStatusBar) / 100;
    double heightWithoutBody =
        (contextSize.height - padding.bottom - padding.top - avatarBarHeight) /
            2;
    // 250, 560, 700 в масиві це хвилини а 200, 300, 100 це мілілітри
    // TODO: display drinkHistory in the Right Side Bar

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
                height: heightWithoutBody,
                // color:Colors.red,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/img/bulb.svg',
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 28,
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
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 45),
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x40000000),
                              offset: Offset(4, 4),
                              blurRadius: 4,
                              spreadRadius: 0)
                        ],
                        color: Color(0xA668C4FB),
                      ),
                      width: double.infinity,
                      child: Text(
                        'Коли організм зневоднений, обмін речовин сповільнюється. Порушення метаболізму може привести до набору ваги.',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                    // AQUARIUM
                    Container(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/img/avatar.svg',
                            height: avatarBarHeight - 25,
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
                    Container(
                      width: 50,
                      height: avatarBarHeight,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          // _generateTimeDrinks(context, now),
                          Text('asd'),
                          //
                          Positioned(
                            left: 33,
                            child: Container(
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
                                  Positioned(
                                    bottom: 0,
                                    height: persentFillBar,
                                    width: 17,
                                    left: 0,
                                    child: Container(
                                      color: Color(0xA668C4FB),
                                      child: _generateDrinks(),
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

                padding: EdgeInsets.only(
                    top: 45, bottom: 45, left: 45, right: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      key: _key,
                      child: btnAddWater(
                        context,
                        'assets/img/drop.svg',
                        _getPositions,
                        _key,
                        'Water',
                      ),
                    ),
                    Container(
                      key: _key1,
                      child: btnAddWater(
                        context,
                        'assets/img/milk.svg',
                        _getPositions,
                        _key1,
                        'Milk',
                      ),
                    ),
                    Container(
                      key: _key2,
                      child: btnAddWater(
                        context,
                        'assets/img/tea.svg',
                        _getPositions,
                        _key2,
                        'Tea',
                      ),
                    ),
                    Container(
                      key: _key3,
                      child: btnAddWater(
                        context,
                        'assets/img/coffee.svg',
                        _getPositions,
                        _key3,
                        'Coffee',
                      ),
                    ),
                    Container(
                      key: _key4,
                      child: btnAddWater(
                        context,
                        'assets/img/juice.svg',
                        _getPositions,
                        _key4,
                        'Juice',
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
    var dayStartTime = ((now.hour / 60) + now.minute).round();
    setState(() {
      todayDrunked += ml;
      drinkHistory.addAll({dayStartTime: ml});
      print(drinkHistory);
      // ADD TIME AND ML TO HISTORI
    });
  }

  Widget _generateDrinks() {
    List<Widget> list = new List<Widget>();
    drinkHistory.forEach((k, v) {
      v += v;
      print(v);
      list.add(
        Positioned(
          bottom:
              (avatarBarHeight * ((v.toDouble() / user['quota']) * 100)) / 100,
          child: v == 0
              ? Text('')
              : Container(
                  width: 17,
                  height: 2,
                  color: Colors.white,
                ),
        ),
      );
    });

    return new Stack(children: list);
    //
    //   // print('${k}: ${v}');
    //     new Positioned(
    //       bottom:
    //           (avatarBarHeight * ((v.toDouble() / user['quota']) * 100)) /
    //               100,
    //       child: v == 0
    //           ? Text('')
    //           : Container(
    //               width: 17,
    //               height: 2,
    //               color: Colors.white,
    //             ),
    //             ),
    //     ).toList(),
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

  // _afterLayout(_) {
  //   _getPositions();
  // }
  RawMaterialButton btnAddWater(
    BuildContext context,
    String img,
    dynamic _getPositions,
    Key keyS,
    String drinkName,
  ) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      onPressed: () {
        showOvarlay(context, _getPositions(keyS), _getBarData, drinkName);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: SvgPicture.asset(
        img,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }

  // _generateTimeDrinks(context, time) {
  //   print('time');
  //   print(time);
  //   // час
  //   print('${time.hour}: ${time.minute}');
  //   String formattedDate = now.second.toString();
  //   List timeArr = [now];
  //   timeArr.add(time);
  //   print(timeArr);
  //   int index = 0;
  //   return new Stack(
  //     children: [
  //       for (var item in pointsBar)
  //         Positioned(
  //           bottom:
  //               (avatarBarHeight * ((item.toDouble() / user['quota']) * 100)) /
  //                   100,
  //           child: Text(
  //             item == 0 ? '' : '18:00',
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .bodyText2
  //                 .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //     ],
  //   );
  // }
}
