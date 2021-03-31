import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';

class WeightChoose extends StatefulWidget {
  @override
  _WeightChooseState createState() => _WeightChooseState();
}

class _WeightChooseState extends State<WeightChoose> {
  var elements1 = [];
  final elements2 = ["kg", "lbs"];

  int selectedIndex1 = 40,
      selectedIndex2 = 0,
      selectedIndex3 = 0,
      selectedIndex4 = 0;

  @override
  void initState() {
    elements1 = _generateArray();
    super.initState();
  }

  _generateArray(){
    return List<String>.generate(240, (index) => (index + 22).toString());
  }
  // List<Widget> _buildItems1() {
  //   return ;
  // }

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
                        "assets/img/slim.png",
                        width: 100,
                      ),
                      _mainSelect(elements2[selectedIndex2], elements1, selectedIndex1,
                          (idd) => selectedIndex1 = idd),
                      _mainSelect('Units', elements2, selectedIndex2, (idd) {
                        if(selectedIndex2 == idd) return;
                        selectedIndex2 = idd;

                        if(idd==0) {
                          elements1 = _generateArray();
                          selectedIndex1 = (selectedIndex1 / 0.45359237).round();
                        }else{
                          elements1 = List<String>.generate((240*0.45359237).round(), (index) => (index + (30*0.45359237).round()).toString());
                          selectedIndex1 = (selectedIndex1 * 0.45359237).round();
                        }
                        selectedIndex1>100?selectedIndex1--:selectedIndex1++;
                        // setState(() {
                        //   elements1 = elements1.map<String>((e) {
                        //     return (double.parse(e) * 0.45359237).round().toString();
                        //   }).toList();
                        //   print(elements1[0]);
                        // });
                      })
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _mainSelect(title, arr, selectedIndex, passParam) {
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
