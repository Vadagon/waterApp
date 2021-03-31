import 'package:flutter/material.dart';
import 'widgets/HeightSelect.dart';
import 'widgets/YearsSelect.dart';
import 'widgets/weightSelect.dart';
import 'widgets/GenderSelect.dart';
import 'widgets/Stepper.dart';


class SetupRoute extends StatefulWidget {
  SetupRoute({this.user, this.cb});
  final dynamic user;
  final Function cb;

  @override
  SetupState createState() => SetupState(user, cb);
}

class SetupState extends State<SetupRoute> {
  Map user;
  Function cb;
  SetupState(this.user, this.cb);

  @override
  initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }



 var _index = 0;

  @override

  Widget build(BuildContext context) {
    
    void changeIndex(){
      setState(() {
        if(_index>2){
          _index=0;
        }
        else{
          _index++;
        }
           
          print(_index);
            });
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              NavStepper(index: _index),
              Expanded(
                child: IndexedStack(
                  index: _index,
                  children: [
                    GenderChoose(),
                    WeightChoose(),
                    HeightChoose(),
                    YearsChoose(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         changeIndex();
        },
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
          size: 25,
        ),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 2,
      ),
    );
  }
}
