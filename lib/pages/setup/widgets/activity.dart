import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibration/vibration.dart';

class ActivitySelect extends StatefulWidget {
  final Function cb;
  ActivitySelect(this.cb);

  @override
  _ActivitySelectState createState() => _ActivitySelectState(this.cb);
}

class _ActivitySelectState extends State<ActivitySelect> {
  final Function cb;
  _ActivitySelectState(this.cb);

  String remindTime = "NORMAL";

  sendData() {
    cb({'activity': remindTime});
    // cb({'weight': 12});
  }

  @override
  Widget build(BuildContext context) {
    sendData();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "Your daily activity",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, right: 20),
          child: SvgPicture.asset(
            'assets/img/activity.svg',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ScaleTap(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/img/a1.svg',
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        padding: EdgeInsets.all(12),
                        margin:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                        decoration: remindTime == 'SEDENTARY'
                            ? BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x40000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      spreadRadius: 0)
                                ],
                                color: const Color(0xb0ac2727))
                            : BoxDecoration(
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x40000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      spreadRadius: 0)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('SEDENTARY',
                                style: remindTime == 'SEDENTARY'
                                    ? Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Color(0xffffffff))
                                    : Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      Vibration.vibrate(duration: 10);
                      remindTime = 'SEDENTARY';
                    });
                  },
                  onLongPress: () {
                    Vibration.vibrate(duration: 30);
                    setState(() {
                      remindTime = 'SEDENTARY';
                    });
                  },
                ),
              ),
              ScaleTap(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/img/a2.svg',
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                      decoration: remindTime == 'NORMAL'
                          ? BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                              color: const Color(0xb0ac2727))
                          : BoxDecoration(
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('NORMAL',
                              style: remindTime == 'NORMAL'
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Color(0xffffffff))
                                  : Theme.of(context).textTheme.headline6)
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    Vibration.vibrate(duration: 10);
                    remindTime = 'NORMAL';
                  });
                },
                onLongPress: () {
                  Vibration.vibrate(duration: 30);
                  setState(() {
                    remindTime = 'NORMAL';
                  });
                },
              ),
              ScaleTap(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/img/a3.svg',
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                      decoration: remindTime == 'ACTIVE'
                          ? BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: const Color(0xb0ac2727),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                            )
                          : BoxDecoration(
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ACTIVE',
                              style: remindTime == 'ACTIVE'
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Color(0xffffffff))
                                  : Theme.of(context).textTheme.headline6)
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    Vibration.vibrate(duration: 10);
                    remindTime = 'ACTIVE';
                  });
                },
                onLongPress: () {
                  Vibration.vibrate(duration: 30);
                  setState(() {
                    remindTime = 'ACTIVE';
                  });
                },
              ),
              ScaleTap(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/img/a4.svg',
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                      decoration: remindTime == 'VERY ACTIVE'
                          ? BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: const Color(0xb0ac2727),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                            )
                          : BoxDecoration(
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x40000000),
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('VERY ACTIVE',
                              style: remindTime == 'VERY ACTIVE'
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Color(0xffffffff))
                                  : Theme.of(context).textTheme.headline6)
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    Vibration.vibrate(duration: 10);
                    remindTime = 'VERY ACTIVE';
                  });
                },
                onLongPress: () {
                  Vibration.vibrate(duration: 30);
                  setState(() {
                    remindTime = 'VERY ACTIVE';
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
