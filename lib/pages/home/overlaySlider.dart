import 'package:flutter/material.dart';

double dragPoint = 0.0;
showOvarlay(BuildContext context) async {
  Size contextSize = MediaQuery.of(context).size;
  EdgeInsets padding = MediaQuery.of(context).padding;
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: contextSize.width,
        // color: Colors.green,
        padding: EdgeInsets.only(top: padding.top),
        height: contextSize.height - padding.bottom,
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
        child: Stack(
          children: [
            Positioned(
              left: 45,
              bottom: 40,
              child: SliderOverlay(contextSize: contextSize),
            ),
          ],
        ),
      ),
    ),
  );
  overlayState.insert(overlayEntry);
  await Future.delayed(Duration(seconds: 1000));
  overlayEntry.remove();
}

class SliderOverlay extends StatefulWidget {
  const SliderOverlay({
    Key key,
    @required this.contextSize,
  }) : super(key: key);

  final Size contextSize;

  @override
  _SliderOverlayState createState() => _SliderOverlayState();
}

class _SliderOverlayState extends State<SliderOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xFF9DEDFF),
              ),
              height: widget.contextSize.height / 2,
              width: 50,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: dragPoint,
                    child: Container(
                      color: Color(0xFFFFFFFF),
                      width: 20,
                      height: 2,
                    ),
                  ),
                ],
              )),
          onVerticalDragUpdate: (axis) {
            setState(() {
              dragPoint = axis.localPosition.dy;
            });
            print(axis.localPosition.direction);
            print(axis.localPosition.distance);
            print(axis.localPosition.distanceSquared);
          },
        ),
        Container(
          width: 200,
          height: widget.contextSize.height / 2 + 20,
          child: Stack(
            children: [
              Positioned(
                top: dragPoint,
                child: Container(
                  width: 200,
                  height: 100,
                  // color: Colors.red,
                  child: Text('+ ${dragPoint.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
              Positioned(
                top: dragPoint+40,
                child: Container(
                   decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF27C1E2),
              ),
                  width: 80,
                  height: 40,
                  child: Center(
                    child: TextButton(
                      child: Text('add',style: Theme.of(context).textTheme.bodyText1),
                      onPressed: (){print(dragPoint.toStringAsFixed(0));},
                  ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
