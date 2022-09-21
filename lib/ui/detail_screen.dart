import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_animation/constant/color_constant.dart';
import 'package:login_animation/model/song_model.dart';
import 'package:login_animation/ui/reusable_widget/circle_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DetailsScreen extends StatefulWidget {
  SongModel songData;
  DetailsScreen({required this.songData, Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DetailsScreen> {
  double _value = 40.0;
  bool _isPlaying = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstant.appMainColor,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(size.width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icons.arrow_back_ios_new_rounded,
                  iconColor: ColorConstant.iconColor,
                  bgColor: ColorConstant.appMainColor,
                ),
                const Text(
                  'Music Player',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
                CircleButton(
                  onTap: () {},
                  icon: Icons.menu,
                  iconColor: ColorConstant.iconColor,
                  bgColor: ColorConstant.appMainColor,
                ),
              ],
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: ColorConstant.appMainColor,
                borderRadius: BorderRadius.circular(
                  size.width * .4,
                ),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
                  //   spreadRadius: 4,
                  //   blurRadius: 6,
                  //   offset: const Offset(4, 4), // changes position of shadow
                  // ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(4, 4), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: size.width * .25,
                child: ClipOval(
                  child: Image.network(
                    widget.songData.image,
                    fit: BoxFit.cover,
                    width: size.width * .8,
                    height: size.width * .8,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Text(
              widget.songData.songName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Text(
              widget.songData.author,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * .04,
            ),
            SizedBox(
              height: size.height * .08,
            ),
            Container(
              margin: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1:21',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '3:46',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            SfSlider(
              activeColor: HexColor("#6790fe"),
              thumbIcon: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.appMainColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
              min: 0.0,
              max: 100.0,
              value: _value,
              interval: 1,
              showTicks: false,
              showLabels: false,
              enableTooltip: false,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            SizedBox(
              height: size.height * .08,
            ),
            Container(
              margin: EdgeInsets.only(
                left: size.width * .15,
                right: size.width * .15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButton(
                    onTap: () {},
                    image: 'assets/images/backword.png',
                    iconColor: ColorConstant.iconColor,
                    bgColor: ColorConstant.appMainColor,
                  ),
                  CircleButton(
                    onTap: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    icon: _isPlaying ? Icons.pause_circle_outline : Icons.play_arrow,
                    iconColor: Colors.white,
                    bgColor: HexColor("#6790fe"),
                  ),
                  CircleButton(
                    onTap: () {},
                    image: 'assets/images/forward.png',
                    iconColor: ColorConstant.iconColor,
                    bgColor: ColorConstant.appMainColor,
                  ),
                ],
              ),
            ),
            // SliderTheme(
            //   data: SliderThemeData(
            //       thumbColor: Colors.green,
            //       thumbShape: RoundSliderThumbShape(
            //         enabledThumbRadius: 20,
            //       )),
            //   child: Slider(
            //     activeColor: HexColor("#80a4fc"),
            //     value: _value,
            //     onChanged: (val) {
            //       _value = val / 100;
            //       setState(() {});
            //     },
            //   ),
            // ),
            // FlutterSlider(
            //   values: const [300],
            //   max: 500,
            //   min: 0,
            //   onDragging: (handlerIndex, lowerValue, upperValue) {
            //     _lowerValue = lowerValue;
            //     _upperValue = upperValue;
            //     setState(() {});
            //   },
            // )
          ],
        ),
      )),
    );
  }
}
