import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibration/vibration.dart';

class HeightSelect extends StatefulWidget {
  final Function cb;
  HeightSelect(this.cb);

  @override
  _HeightSelectState createState() => _HeightSelectState(cb);
}

class _HeightSelectState extends State<HeightSelect> {
  final Function cb;
  _HeightSelectState(this.cb);

  var unitsCm = [];
  var unitsInch = [];
  final unitsType = ["cm", "inch"];

  int unitsId = 81, unitsTypeId = 0;

  @override
  void initState() {
    unitsCm = List<String>.generate(240, (index) => (index + 80).toString());
    unitsInch = List<String>.generate(95, (index) => (index + 32).toString());
    super.initState();
  }

  // List<Widget> _buildItems1() {
  //   return ;
  // }
  //
  sendData() {
    cb({
      'height': unitsTypeId == 0
          ? unitsCm[unitsId]
          : (int.parse(unitsInch[unitsId]) * 2.54).round()
    });
    // cb({'weight': 12});
  }

  @override
  Widget build(BuildContext context) {
    sendData();
    // units = List<String>.generate(240, (index) => (index + 30).toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'How much do you heigh?',
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: SvgPicture.asset(
            'assets/img/tall.svg',
            width: 80,
            height: 80,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _mainSelect(
                unitsType[unitsTypeId],
                unitsTypeId == 0 ? unitsCm : unitsInch,
                unitsId,
                (idd) => unitsId = idd),
            _mainSelect('Units', unitsType, unitsTypeId, (idd) {
              if (unitsTypeId == idd) return;

              setState(() {
                unitsTypeId = idd;
                if (idd == 0) {
                  unitsId = (unitsId * 2.54).round();
                } else {
                  unitsId = (unitsId / 2.54).round();
                }
                unitsId > 100 ? unitsId-- : unitsId++;
              });
            })
          ]),
        ),
      ],
    );
  }

  _mainSelect(title, arr, selectedIndex, passParam) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScaleTap(
          onTap: (){
        Vibration.vibrate(duration: 20);
      },
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: 80,
            child: DirectSelect(
                mode: DirectSelectMode.tap,

                itemExtent: 55.0,
                selectedIndex: selectedIndex,
                backgroundColor:  Colors.white,
                child: MySelectionItem(
                  isForList: false,
                  title: arr[selectedIndex],
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    passParam(index);
                    selectedIndex = index;
                  });
                },
                items: arr
                    .map<Widget>((val) => MySelectionItem(
                          title: val,
                        ))
                    .toList()),
          ),
        ),
      ],
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
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
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
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
