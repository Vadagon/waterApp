import "dart:math";
import 'package:flutter/material.dart';

class Hint extends StatefulWidget {
  @override
  _HintState createState() => _HintState();
}

class _HintState extends State<Hint> {
  // TODO: PUT HERE ENG HINTS VLAD
  var list = [
    'Коли організм зневоднений, обмін речовин сповільнюєт3ься. Порушення метаболізму може привести до набору ваги.',
    'Коли організм зневоднений, обмін речовин сповільнюєт5ься. Порушення метаболізму може привести до набору ваги.',
    'Коли організм зневоднений, обмін речовин сповільнюєт2ься. Порушення метаболізму може привести до набору ваги.',
    'Коли організм зневоднений, обмін речовин сповільнюєть4ся. Порушення метаболізму може привести до набору ваги.',
    'Коли організм зневоднений, обмін речовин сповільнюєт1ься. Порушення метаболізму може привести до набору ваги.',
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
