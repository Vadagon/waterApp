import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';

// ignore: must_be_immutable
class GenderChoose extends StatelessWidget {
  var blueRedGradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.blueAccent, Colors.blue, Colors.blue, Colors.purple]);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GenderSelection(
            femaleImage: AssetImage('assets/img/female.png'),
            maleImage: AssetImage('assets/img/male.png'),
            size: 100,
            opacityOfGradient: 0.5,
            linearGradient: blueRedGradient,
            selectedGenderIconBackgroundColor: Colors.blueAccent,
            selectedGenderTextStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 19,
                fontWeight: FontWeight.bold),
            onChanged: (Gender value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
