import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibration/vibration.dart';

class WakeUpSelect extends StatefulWidget {
  final String title;
  final int finalIndex;
  final String img;
  final Function cb;
  WakeUpSelect({this.title, this.img, this.finalIndex, this.cb});

  @override
  _WakeUpSelectState createState() =>
      _WakeUpSelectState(title, img, finalIndex, cb);
}

class _WakeUpSelectState extends State<WakeUpSelect> {
  var elements1 = [];
  final String title;
  final String img;
  final Function cb;
  int finalIndex;
  _WakeUpSelectState(this.title, this.img, this.finalIndex, this.cb);

  @override
  void initState() {
    elements1 = _generateArray();
    super.initState();
  }

  _generateArray() {
    return List<String>.generate(24, (index) => index.toString());
  }

  sendData() {
    cb({!title.contains('sleep') ? 'wakeUp' : 'sleep': finalIndex});
    // cb({'weight': 12});
  }

  @override
  Widget build(BuildContext context) {
    sendData();
    // elements1 = List<String>.generate(240, (index) => (index + 30).toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$title',
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: SvgPicture.asset(
            'assets/img/$img.svg',
            width: 80,
            height: 80,
          ),
        ),
        _mainSelect('yo', elements1, finalIndex),
      ],
    );
  }

  _mainSelect(title, arr, selectedIndex) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScaleTap(
            onTap: () {
              Vibration.vibrate(duration: 20);
            },
            child: Container(
              width: 150,
              child: DirectSelect(
                mode: DirectSelectMode.tap,
                itemExtent: 55.0,
                selectedIndex: selectedIndex,
                backgroundColor: Colors.white,
                child: MySelectionItem(
                  isForList: false,
                  title: arr[selectedIndex],
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                    finalIndex = index;
                  });
                },
                items: arr
                    .map<Widget>(
                      (val) => MySelectionItem(
                        title: val,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: isForList
          ? Padding(
              child: _buildItemsSelect(context),
              padding: EdgeInsets.all(10.0),
            )
          : Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0)
                ],
              ),
              child: Stack(
                children: <Widget>[
                  _buildTitleSelect(context),
                  Align(
                    alignment: Alignment(1, 2),
                    child: Icon(Icons.arrow_drop_down_rounded,
                        color: Colors.black),
                  ),
                  Align(
                    alignment: Alignment(1, -2),
                    child:
                        Icon(Icons.arrow_drop_up_rounded, color: Colors.black),
                  ),
                ],
              ),
            ),
    );
  }

  _buildTitleSelect(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(00),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Text(
        title + ':00',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  _buildItemsSelect(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        title + ':00',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
