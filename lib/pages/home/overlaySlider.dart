import 'package:flutter/material.dart';

double dragPoint = 0.0;
showOvarlay(BuildContext context) async {
  Size contextSize = MediaQuery.of(context).size;
  EdgeInsets padding = MediaQuery.of(context).padding;
  Function cb;
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
              child: SliderOverlay(cb: cb, contextSize: contextSize),
            ),
          ],
        ),
      ),
    ),
  );
  cb = () {
    overlayEntry.remove();
  };
  overlayState.insert(overlayEntry);
  await Future.delayed(Duration(seconds: 1000));
  overlayEntry.remove();
}

class SliderOverlay extends StatefulWidget {
  const SliderOverlay({
    Key key,
    @required this.contextSize,
    @required this.cb,
  }) : super(key: key);

  final Function cb;
  final Size contextSize;

  @override
  _SliderOverlayState createState() => _SliderOverlayState(cb);
}

class _SliderOverlayState extends State<SliderOverlay> {
  _SliderOverlayState(this.cb);
  final Function cb;
  double ml = 1000;
  double btnPos = 0;
  double textPos = 0;
  double dragPoint = 0;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: widget.contextSize.height / 2,
          child: Row(
            children: [
                Container(
                            clipBehavior: Clip.antiAlias,

                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0xFF9DEDFF),
                    ),
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
                    ),),
                
              Container(
                width: 200,
                height: widget.contextSize.height / 2 + 20,
                child: Stack(
                  children: [
                    Positioned(
                      top: dragPoint - textPos,
                      left: 10,
                      child: Container(
                        width: 200,
                        height: 100,
                        // color: Colors.red,
                        child: Text('+ ${((ml/25).floor())*25} ml',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ),
                    Positioned(
                      top: dragPoint + 40 - btnPos,
                      left: 10,

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF27C1E2),
                        ),
                        width: 80,
                        height: 40,
                        child: Center(
                          child: TextButton(
                            child: Text('add',
                                style: Theme.of(context).textTheme.bodyText1),
                            onPressed: () {
                              cb();
                              print(((ml/25).floor())*25);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),),
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
                     textPos = 80;
                     btnPos = 80;
                    
                  } 
                  else {
                    textPos = 0;
                     btnPos = 0;
                    
                  }
                  if (dragPoint > maxHeight) {
                    ml = 0;
                    dragPoint = maxHeight ;
                  } 
                   if (dragPoint < 0) {
                    ml = 1000;
                    dragPoint = 0;
                  } 
                  else {
                  //  dragPoint =  ((((dragPoint/10).floor())*10)).toDouble();
                  }
                    print(dragPoint);
                // print(ml);
                });

              
                // print(axis.localPosition.direction);
                // print(axis.localPosition.distance);
                // print(axis.localPosition.distanceSquared);
              },
    );
  }
}
