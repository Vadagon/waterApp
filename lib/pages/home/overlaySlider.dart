import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

  showOvarlay(BuildContext context) async {
    Size contextSize = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    OverlayState overlayState = Overlay.of(context);
    double _value = 1;
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        child: Container(
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
              RawMaterialButton(
                constraints: BoxConstraints.tightFor(width: 50, height: 50),
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/img/juice.svg',
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
  //             SliderTheme(
  // data: SliderTheme.of(context).copyWith(
  //   activeTrackColor: Colors.red,
  //   inactiveTrackColor: Colors.black,
  //   trackHeight: 3.0,
  //   thumbColor: Colors.yellow,
  //   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
  //   overlayColor: Colors.purple.withAlpha(32),
  //   overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
  // ),
  // child: Slider(
  //     value: _value,
  //     onChanged: (value) {
  //       setState(() {
  //         _value = value;
  //       });
  //     }),
  //         ),
            ],
          ),
        ),
      ),
    );
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 2));
    overlayEntry.remove();
  }