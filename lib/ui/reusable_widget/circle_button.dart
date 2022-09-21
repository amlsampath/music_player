import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CircleButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final double padding;
  final String? image;
  final IconData? icon;
  final Function onTap;
  final bool isSelected;
  const CircleButton({
    this.padding = 16.0,
    required this.bgColor,
    required this.onTap,
    required this.iconColor,
    this.isSelected = false,
    this.icon,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isSelected ? HexColor("#6790fe") : bgColor,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //ColorConstant.appMainColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: icon == null
            ? Image.asset(
                image!,
                width: size.width * .03,
              )
            : Icon(
                icon,
                color: isSelected ? Colors.white : iconColor,
                size: 20,
              ),
      ),
    );
  }
}
