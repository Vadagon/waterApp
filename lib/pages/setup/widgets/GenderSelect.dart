import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderSelect extends StatefulWidget {
  @override
  _GenderSelectState createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  bool _gender = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "HELLO!",
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("Select your gender?",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0),
                textAlign: TextAlign.left),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 142,
                    height: 142,
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
                    print(_gender);
                  },
                ),
                InkWell(
                  child: Container(
                    width: 142,
                    height: 142,
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
