import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';

class YearsChoose extends StatefulWidget {
  @override
  _YearsChooseState createState() => _YearsChooseState();
}

class _YearsChooseState extends State<YearsChoose> {
  var elements1 = [];

  int selectedIndex1 = 8,
      selectedIndex2 = 0,
      selectedIndex3 = 0,
      selectedIndex4 = 0;

  @override
  void initState() {
    elements1 = _generateArray();
    super.initState();
  }

  _generateArray(){
    return List<String>.generate(79, (index) => (index + 12).toString());
  }


  @override
  Widget build(BuildContext context) {
    // elements1 = List<String>.generate(240, (index) => (index + 30).toString());
    return Scaffold(
      body: Padding(
        
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
          padding: EdgeInsets.only(bottom: 166),
                
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/img/new-years-eve.png",
                        width: 100,
                      ),
                     
                      _mainSelect('Years', elements1, selectedIndex1),
                        ],
          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _mainSelect(title, arr, selectedIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12),
        ),
        Container(
          
          width: 80,
          child: DirectSelect(
              itemExtent: 55.0,
              selectedIndex: selectedIndex,
              backgroundColor: Theme.of(context).accentColor,
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
                  .map<Widget>((val) => MySelectionItem(
                        title: val,
                      ))
                  .toList()),
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
      height: 40.0,
      child: isForList
          ? Padding(
              child: _buildItemsSelect(context),
              padding: EdgeInsets.all(10.0),
            )
          : Container(
              child: Stack(
                children: <Widget>[
                 _buildTitleSelect(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).accentColor,),
                  )
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
      child: Text(title),
    );
  }



  _buildItemsSelect(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
