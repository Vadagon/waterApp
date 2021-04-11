import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    //  WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    // num dailyQuota = waterCalculator(user);
    // print(user['quota']);

    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  double btnHeight = 46;
  var todayDrunked = 400;

  @override
  Widget build(BuildContext context) {
    Size contextSize = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Color(0xFF1B61CB),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: contextSize.width,
              height: contextSize.height - padding.top - padding.bottom,
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
              // BG GRADIENT AND SIZE WINDOW

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
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                  // HINT
                  //
                  Spacer(),
                  //  
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // AQUARIUM
                        Text(''),
                        Container(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/img/avatar.svg',
                                height: contextSize.height / 2,
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
                          clipBehavior: Clip.antiAlias,
                          width: 17,
                          height: contextSize.height / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x40000000),
                                  offset: Offset(4, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0)
                            ],
                            color: Color(0xFFFFFFFF),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 17,
                                      // color: Color(0xFFFFFFFF),
                                      color: Colors.red,
                                    ),
                                    Container(
                                      height: 200,
                                      width: 17,
                                      color: Color(0xA668C4FB),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 201,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 17,
                                      // color: Color(0xFFFFFFFF),
                                      color: Colors.red,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 17,
                                      color: Color(0xA668C4FB),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 222,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 17,
                                      // color: Color(0xFFFFFFFF),
                                      color: Colors.red,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 17,
                                      color: Color(0xA668C4FB),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top:45, bottom: 45, left: 45, right: 45),
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
                          ),
                        ),
                        Container(
                          key: _key1,
                          child: btnAddWater(
                            context,
                            'assets/img/milk.svg',
                            _getPositions,
                            _key1,
                          ),
                        ),
                        Container(
                          key: _key2,
                          child: btnAddWater(
                            context,
                            'assets/img/tea.svg',
                            _getPositions,
                            _key2,
                          ),
                        ),
                        Container(
                          key: _key3,
                          child: btnAddWater(
                            context,
                            'assets/img/coffee.svg',
                            _getPositions,
                            _key3,
                          ),
                        ),
                        Container(
                          key: _key4,
                          child: btnAddWater(
                            context,
                            'assets/img/juice.svg',
                            _getPositions,
                            _key4,
                          ),
                        ),
                        //     Container(
                        // key: _key1,
                        // child: btnAddWater(
                        //   context,
                        //   'assets/img/milk.svg',
                        //   _getPositions(_key1),
                        // ),
                        // ),
                        // btnAddWater(context, 'assets/img/milk.svg', [100, 50]),
                        // btnAddWater(context, 'assets/img/tea.svg', [200, 50]),
                        // btnAddWater(
                        //     context, 'assets/img/coffee.svg', [300, 50]),
                        // btnAddWater(context, 'assets/img/juice.svg', [400, 50]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic _getPositions(keyS) {
    final RenderBox renderDrop = keyS.currentContext.findRenderObject();
    // final RenderBox renderMilk = _keyMilk.currentContext.findRenderObject();
    // final RenderBox renderTea = _keyTea.currentContext.findRenderObject();
    // final RenderBox renderCoffee = _keyCoffee.currentContext.findRenderObject();
    // final RenderBox renderJuice = _keyJuice.currentContext.findRenderObject();
    final positionDrop = renderDrop.localToGlobal(Offset.zero);
    double y = positionDrop.dy;
    double x = positionDrop.dx;
    // final positionMilk = renderMilk.localToGlobal(Offset.zero);
    // final positionTea = renderTea.localToGlobal(Offset.zero);
    // final positionCoffee = renderCoffee.localToGlobal(Offset.zero);
    // final positionJuice = renderJuice.localToGlobal(Offset.zero);
    print("POSITION of renderDrop: $y ");
    print("POSITION of renderDrop: $x ");
    return [x, y];
    // print("POSITION of renderDrop: $positionMilk ");
    // print("POSITION of renderDrop: $positionTea ");
    // print("POSITION of renderDrop: $positionCoffee ");
    // print("POSITION of renderDrop: $positionJuice ");
  }

  // _afterLayout(_) {
  //   _getPositions();
  // }
  RawMaterialButton btnAddWater(
    BuildContext context,
    String img,
    dynamic _getPositions,
    Key keyS,
  ) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      onPressed: () {
        showOvarlay(context, _getPositions(keyS));
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
}
