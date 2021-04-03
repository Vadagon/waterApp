import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReminderSelect extends StatefulWidget {
  @override
  _ReminderSelectState createState() => _ReminderSelectState();
}

class _ReminderSelectState extends State<ReminderSelect> {
  bool _gender = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("how often do you want to \n recive reminders?",
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0),
              textAlign: TextAlign.center),
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
                  decoration: !_gender
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: const Color(0xffffffff))
                      : BoxDecoration(
                          color: const Color(0xb0ac2727),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                  child: Text('Every 1 hour'),
                ),
                onTap: () {
                  setState(() {
                    _gender = false;
                  });
                  print(_gender);
                },
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  decoration: _gender
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: const Color(0xffffffff))
                      : BoxDecoration(
                          color: const Color(0xb0ac2727),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                  child: Text('Every 2 hour', style:Theme.of(context).textTheme.headline6),
                ),
                onTap: () {
                  setState(() {
                    _gender = true;
                  });
                  print(_gender);
                },
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  decoration: _gender
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: const Color(0xffffffff))
                      : BoxDecoration(
                          color: const Color(0xb0ac2727),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                  child: Text('do not remind'),
                ),
                onTap: () {
                  setState(() {
                    _gender = true;
                  });
                  print(_gender);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
