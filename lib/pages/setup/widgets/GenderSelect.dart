import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:vibration/vibration.dart';

class GenderSelect extends StatefulWidget {
  GenderSelect(this.cb);
  final Function cb;

  @override
  _GenderSelectState createState() => _GenderSelectState(this.cb);
}

class _GenderSelectState extends State<GenderSelect> {
  _GenderSelectState(this.cb);
  Function cb;

  bool _gender = false;

  // initState() {
  //   super.initState();
  //   sendData();
  // }

  sendData() {
    cb({'gender': _gender ? 'male' : 'female'});
  }

  @override
  Widget build(BuildContext context) {
    sendData();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "HELLO!",
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            "Select your gender?",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 
              ScaleTap(
                onLongPress: (){
                     setState(() {
                    _gender = false;
                  });
                 Vibration.vibrate(
                    duration:  30,
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  padding: EdgeInsets.all(12),
                  decoration: !_gender
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: const Color(0xb0ac2727))
                      : BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          'assets/img/man.svg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Text(
                        "Male",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _gender = false;
                  });
                   Vibration.vibrate(
                    duration:  10,
                  );
                },
              ),
              ScaleTap(
                child: Container(
                  width: 150,
                  height: 150,
                  padding: EdgeInsets.all(12),
                  decoration: _gender
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: const Color(0xb0ac2727))
                      : BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          'assets/img/woman.svg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Text(
                        "Female",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _gender = true;
                  });
                   Vibration.vibrate(
                    duration:  10,
                  );
                },
                   onLongPress: (){
                     setState(() {
                    _gender = true;
                  });
                  Vibration.vibrate(
                    duration:  30,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
