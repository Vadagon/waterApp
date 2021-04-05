import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReminderSelect extends StatefulWidget {
  @override
  _ReminderSelectState createState() => _ReminderSelectState();
}

class _ReminderSelectState extends State<ReminderSelect> {
  String remindTime = "Every 1 hour";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("how often do you want to \n recive reminders?",
              style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
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
              InkWell(
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
                onTap: () {
                  setState(() {
                    remindTime = 'Every 1 hour';
                  });
                },
              ),
              InkWell(
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
                    remindTime = 'Every 2 hour';
                  });
                },
              ),
              InkWell(
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
