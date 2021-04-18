import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

showOvarlay(
    BuildContext context, List pos, Function cb2, String drinkName) async {
  // print(pos);
  Size contextSize = MediaQuery.of(context).size;
  EdgeInsets padding = MediaQuery.of(context).padding;
  Function cb;
  Function close;
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      child: Container(
        clipBehavior: Clip.none,

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
              Color(0xE600D7CA),
              Color(0xcE61B61CB),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                child: GestureDetector(
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    onTap: () {
                      close();
                    }),
              ),
            ),
            Positioned(
              left: pos[0] > contextSize.width / 2
                  ? pos[0].toDouble() - 150
                  : pos[0].toDouble(),
              top: pos[1].toDouble() - contextSize.height / 2,
              child: SliderOverlay(
                  cb: cb,
                  contextSize: contextSize,
                  pos: pos,
                  drinkName: drinkName),
            ),
            Positioned(
              width: contextSize.width,
              child: Center(
                  child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(drinkName,
                          style: Theme.of(context).textTheme.headline1))),
            ),
          ],
        ),
      ),
    ),
  );
  cb = (ml) {
    cb2(ml);
    overlayEntry.remove();
  };
  close = () {
    overlayEntry.remove();
  };
  overlayState.insert(overlayEntry);
}

class SliderOverlay extends StatefulWidget {
  const SliderOverlay({
    Key key,
    @required this.contextSize,
    @required this.drinkName,
    @required this.cb,
    this.pos,
  }) : super(key: key);

  final String drinkName;
  final Function cb;
  final List pos;
  final Size contextSize;

  @override
  _SliderOverlayState createState() => _SliderOverlayState(
        cb,
        pos,
        contextSize,
        drinkName,
      );
}

class _SliderOverlayState extends State<SliderOverlay> {
  _SliderOverlayState(this.cb, this.pos, this.contextSize, this.drinkName);
  final Function cb;
  final List pos;
  final String drinkName;
  final Size contextSize;
  double ml = 400;
  double btnPos = 0;
  double textPos = 0;
  double pointPos = 0;
  double iconPos = 70;

  double dragPoint;
  initState() {
    double centerOfBar = (contextSize.height / 2) / 2;
    double every100px = ((contextSize.height / 2) / 1000) * 100;
    print(every100px);
    dragPoint = centerOfBar + every100px;
    // print(user['quota']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool adapt = (pos[0] > (widget.contextSize.width / 2));
    return GestureDetector(
      child: Container(
        width: 206,
        height: widget.contextSize.height / 2,
        child: Stack(
          children: [
            Positioned(
              width: 50,
              height: widget.contextSize.height / 2 - 6,
              left: adapt ? 150 : 0,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x40000000),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color(0xFF9DEDFF),
                ),
                width: 50,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease,
                      right: adapt ? null : 0,
                      left: !adapt ? null : 0,
                      top: dragPoint - pointPos,
                      child: Container(
                        color: Color(0xFFFFFFFF),
                        width: 20,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: adapt ? 30 : 50,
              child: Container(
                width: 120,
                height: widget.contextSize.height / 2 + 20,
                child: Stack(
                  children: [
                    // TODO: NEED ADD ICONS FOR 100ml, 250, 500...
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease,
                      top: dragPoint - textPos - iconPos,
                      left: 10,
                      child: Container(
                        // color: Colors.red,
                        width: 80,
                        height: 50,

                        child: SvgPicture.asset(
                          'assets/img/$drinkName.svg',
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease,
                      top: dragPoint - textPos,
                      left: 10,
                      child: Container(
                        width: 200,
                        height: 100,
                        child: Text('+ ${((ml / 25).floor()) * 25} ml',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease,
                      top: dragPoint + 40 - btnPos - 6,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x40000000),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                                spreadRadius: 0)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xFF27C1E2),
                        ),
                        width: 80,
                        height: 40,
                        child: Center(
                          child: TextButton(
                            child: Text('add',
                                style: Theme.of(context).textTheme.bodyText1),
                            onPressed: () {
                              cb(((ml / 25).floor()) * 25);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onVerticalDragUpdate: (axis) {
        setState(() {
          dragPoint = axis.localPosition.dy;
          var maxHeight = widget.contextSize.height / 2;
          var percent = (dragPoint / maxHeight) * 100;
          var maxLitres = 1000;
          var litres = maxLitres * (percent / 100);
          ml = (litres - 1000).abs();
          if (ml > 1000) {
            ml = 1000;
          }
          if (ml < 200) {
            pointPos = 8;
            textPos = 80;
            btnPos = 80;
          } else {
            textPos = 0;
            pointPos = 0;
            btnPos = 0;
          }
          if (dragPoint > maxHeight) {
            ml = 0;
            dragPoint = maxHeight;
          }
          if (dragPoint < 0) {
            ml = 1000;
            dragPoint = 0;
          }
          if (dragPoint < 70) {
            iconPos = -100;
          } else {
            iconPos = 70;
          }
          print(dragPoint);
        });
      },
    );
  }
}
