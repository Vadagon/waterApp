import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:vibration/vibration.dart';

class ReminderSelect extends StatefulWidget {
  final Function cb;
  ReminderSelect(this.cb);

  @override
  _ReminderSelectState createState() => _ReminderSelectState(cb);
}

class _ReminderSelectState extends State<ReminderSelect> {
  Function cb;
  _ReminderSelectState(this.cb);

  String remindTime = "Every 1 hour";

  sendData() {
    cb({'reminder': remindTime});
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
            "How often do you want to \n recive reminders?",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, right: 20),
          child: SvgPicture.asset(
            'assets/img/remind.svg',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTap(
                onTap: () {
                  setState(() {
                    Vibration.vibrate(duration: 10);
                    remindTime = 'Every 1 hour';
                  });
                },
                onLongPress: () {
                  Vibration.vibrate(duration: 30);
                  setState(() {
                    remindTime = 'Every 1 hour';
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  decoration: remindTime == 'Every 1 hour'
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Every 1 hour',
                          style: remindTime == 'Every 1 hour'
                              ? Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Color(0xffffffff))
                              : Theme.of(context).textTheme.headline6)
                    ],
                  ),
                ),
              ),
              ScaleTap(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  decoration: remindTime == 'Every 2 hour'
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Every 2 hour',
                          style: remindTime == 'Every 2 hour'
                              ? Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Color(0xffffffff))
                              : Theme.of(context).textTheme.headline6)
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    Vibration.vibrate(duration: 10);
                    remindTime = 'Every 2 hour';
                  });
                },
                onLongPress: () {
                  Vibration.vibrate(duration: 30);
                  setState(() {
                    remindTime = 'Every 2 hour';
                  });
                },
              ),
              ScaleTap(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  decoration: remindTime == 'Do not remind'
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do not remind',
                          style: remindTime == 'Do not remind'
                              ? Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Color(0xffffffff))
                              : Theme.of(context).textTheme.headline6)
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    Vibration.vibrate(duration: 10);
                    remindTime = 'Do not remind';
                  });
                },
                onLongPress: () {
                  Vibration.vibrate(duration: 30);
                  setState(() {
                    remindTime = 'Do not remind';
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
