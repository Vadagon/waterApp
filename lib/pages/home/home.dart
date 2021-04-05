import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    Size contextSize = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
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
                    child: Text(
                      'Коли організм зневоднений, обмін речовин сповільнюється. Порушення метаболізму може привести до набору ваги.',
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                        width: 17,
                        height: contextSize.height / 5,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child:Column(
                      children: [
                         SvgPicture.asset(
                            'assets/img/aquarium1.svg',
                            width: contextSize.height / 5,
                          ),
                          Text('0/1900',
                           style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,),
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
