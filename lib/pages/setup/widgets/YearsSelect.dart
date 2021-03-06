import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibration/vibration.dart';

class YearsSelect extends StatefulWidget {
  YearsSelect(this.cb);
  final Function cb;

  @override
  _YearsSelectState createState() => _YearsSelectState(this.cb);

  // SetupRoute({this.user, this.cb});
  // final dynamic user;
  // final Function cb;

  // @override
  // _YearsSelectState createState() => _YearsSelectState(user, cb);

}

class _YearsSelectState extends State<YearsSelect> {
  _YearsSelectState(this.cb);
  Function cb;

  var elements1 = [];

  int selectedIndex1 = 8;

  @override
  void initState() {
    elements1 = _generateArray();
    super.initState();
  }

  _generateArray() {
    return List<String>.generate(79, (index) => (index + 12).toString());
  }

  sendData() {
    cb({'age': elements1[selectedIndex1]});
  }

  @override
  Widget build(BuildContext context) {
    sendData();
    // elements1 = List<String>.generate(240, (index) => (index + 30).toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'How old are you?',
          style: Theme.of(context).textTheme.headline1,
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: SvgPicture.asset(
            'assets/img/years_icon.svg',
            width: 80,
            height: 80,
          ),
        ),
        _mainSelect('yo', elements1, selectedIndex1),
      ],
    );
  }

  _mainSelect(title, arr, selectedIndex) {
    return ScaleTap(
      onTap: (){
        Vibration.vibrate(duration: 20);
      },
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: DirectSelect(

                itemMagnification: 2,
                mode: DirectSelectMode.tap,
                itemExtent: 45.0,
                selectedIndex: selectedIndex,
                backgroundColor: Colors.white,
                child: MySelectionItem(
                  isForList: false,
                  title: arr[selectedIndex],
                ),
                onSelectedItemChanged: (index) {
                  
                  setState(() {
                    selectedIndex = index;
                    selectedIndex1 = index;
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
          ],
        ),
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
        title + ' yo',
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
