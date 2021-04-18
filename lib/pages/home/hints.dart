import "dart:math";
import 'package:flutter/material.dart';

class Hint extends StatefulWidget {
  @override
  _HintState createState() => _HintState();
}

class _HintState extends State<Hint> {
  var list = [
    'Thousands have lived without love, not one without water.',
    'Water is life’s matter and matrix, mother and medium. There is no life without water.',
    'When the well’s dry, we know the worth of water.',
    'If there is magic on this planet, it is contained in water.',
    'Water is the driving force of all nature.',
    'Nothing is softer or more flexible than water, yet nothing can resist it.',
    'We forget that the water cycle and the life cycle are one.',
    'In one drop of water are found all the secrets of all the oceans.',
  ];
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    Size contextSize = MediaQuery.of(context).size;

    var element = list[_random.nextInt(list.length)];
    return Container(
      constraints:
          BoxConstraints(minWidth: 100, maxWidth: contextSize.width / 1.7),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Text(
        element,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: Colors.white,
              fontSize: 11,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
