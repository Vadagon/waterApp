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
  HomeState(this.user, this.cb);
  GlobalKey _keyRed = GlobalKey();

  @override
  initState() {
    print(user);
    // num dailyQuota = waterCalculator(user);
    // print(user['quota']);

    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  _getPositions() {
    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $positionRed ");
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
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('This is a snackbar')));
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tightFor(width: 50, height: 50),
                          onPressed: () {
                            showOvarlay(context);
                            _getPositions();
                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/img/drop.svg',
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          key: _keyRed,
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tightFor(width: 50, height: 50),
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/img/milk.svg',
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tightFor(width: 50, height: 50),
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/img/tea.svg',
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tightFor(width: 50, height: 50),
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/img/coffee.svg',
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tightFor(width: 50, height: 50),
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/img/juice.svg',
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
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
    );
  }
}
