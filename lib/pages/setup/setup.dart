import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';

import 'widgets/GenderSelect.dart';
import 'widgets/HeightSelect.dart';
import 'widgets/Remainder.dart';
import 'widgets/WakeUp.dart';
import 'widgets/YearsSelect.dart';
import 'widgets/activity.dart';
import 'widgets/weightSelect.dart';

class SetupRoute extends StatefulWidget {
  SetupRoute({this.user, this.cb});
  final dynamic user;
  final Function cb;

  @override
  SetupState createState() => SetupState(user, cb);
}

class SetupState extends State<SetupRoute> {
  final CarouselController _controller = CarouselController();
  Map user;
  Function cb;
  SetupState(this.user, this.cb);

  Map data;
  @override
  initState() {
    data = jsonDecode(jsonEncode(user));
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  processSetupData(e) {
    data = {...data, ...e};
    print('processSetupData');
    print(e);
    print(data);
  }

  int _current = 0;
  List _slides = [1, 2, 3, 4, 5, 6, 7, 8];

  Widget _slideIndex(int s) {
    print(s);
    if (s == 1) {
      return GenderSelect(processSetupData);
    }
    if (s == 2) {
      return YearsSelect(processSetupData);
    }
    if (s == 3) {
      return WeightSelect(processSetupData);
    }
    if (s == 4) {
      return HeightSelect(processSetupData);
    }
    if (s == 5) {
      return ReminderSelect(processSetupData);
    }
    if (s == 6) {
      return WakeUpSelect(
        cb: processSetupData,
        title: 'Wake up time',
        img: 'wakeUp',
        finalIndex: 8,
      );
    }
    if (s == 7) {
      return WakeUpSelect(
        cb: processSetupData,
        title: 'Time to sleep',
        img: 'sleepTime',
        finalIndex: 22,
      );
    }
    if (s == 8) {
      return ActivitySelect(processSetupData);
    }
    return ActivitySelect(processSetupData);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: [
                      0.0,
                      0.8,
                    ],
                    colors: [
                      Color(0xc2f3af48),
                      Color(0xfff43843),
                    ],
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: size.height,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                        print(_current);
                      });
                    },
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: false,
                    scrollDirection: Axis.horizontal,
                  ),
                  carouselController: _controller,
                  items: _slides.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return _slideIndex(i);
                      },
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: 50,
                child: Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _slides.map((url) {
                      int index = _slides.indexOf(url);
                      return Container(
                        width: 7.0,
                        height: 7.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Color.fromRGBO(255, 255, 255, 1)
                              : Color(0xff8c1616),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                right: 25,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/img/right-arrow.svg',
                        width: 13,
                        height: 33,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_current == 7) {
                      Navigator.pushNamed(context, '/');
                      cb(data);
                    } else {
                      _controller.nextPage();
                    }
                  },
                ),
              ),
              _current != 0
                  ? Positioned(
                      bottom: 25,
                      left: 25,
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/img/left-arrow.svg',
                              width: 13,
                              height: 33,
                            ),
                          ),
                        ),
                        onTap: () => _controller.previousPage(),
                      ),
                    )
                  : Text(''),
            ],
          )
        ],
      ),
    );
  }
}
