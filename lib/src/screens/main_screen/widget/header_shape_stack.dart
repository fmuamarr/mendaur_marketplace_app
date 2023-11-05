import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';

class HeaderShapeStack extends StatelessWidget {
  const HeaderShapeStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2.5,
          right: 2.5,
          child: ClipPath(
            clipper: HeadClipperPath(),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF8BBCD6).withOpacity(0.5),
                border: Border.all(color: kPrimaryColor),
              ),
              width: MediaQuery.of(context).size.width,
              height: 75,
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: ClipPath(
            clipper: HeadClipperPath(),
            child: Container(
              decoration: BoxDecoration(
                color: kSwatchColor,
                border: Border.all(color: kPrimaryColor),
              ),
              width: MediaQuery.of(context).size.width,
              height: 75,
            ),
          ),
        ),
      ],
    );
  }
}

class HeadClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();
    path.moveTo(0, size.height * 0.3364028);
    path.cubicTo(
        size.width * 0.1203226,
        size.height * 0.3559585,
        size.width * 0.3731767,
        size.height * 0.4742632,
        size.width * 0.5023256,
        size.height * 0.8113208);
    path.cubicTo(
        size.width * 0.5490186,
        size.height * 0.9331849,
        size.width * 0.6196209,
        size.height * 0.9873208,
        size.width * 0.6979465,
        size.height);
    path.lineTo(size.width * 0.7771256, size.height);
    path.cubicTo(
        size.width * 0.8537605,
        size.height * 0.9889906,
        size.width * 0.9325116,
        size.height * 0.9490755,
        size.width,
        size.height * 0.9019745);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.3364028);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(HeadClipperPath oldClipper) {
    return false;
  }
}
