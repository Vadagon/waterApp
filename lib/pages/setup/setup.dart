import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    Size size = MediaQuery.of(context).size;
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
      body: CarouselSlider(
  options: CarouselOptions(
    height: size.height,
      aspectRatio: 16/9,
      viewportFraction: 1,
      initialPage: 1,
      enableInfiniteScroll: false,
      reverse: false,
      autoPlay: false,
      autoPlayCurve: Curves.fastOutSlowIn,
      // onPageChanged: ,
      scrollDirection: Axis.horizontal,
    ),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 0.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
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
