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
                color: const Color(0xFF8BBCD6).withOpacity(0.5),
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
    path.moveTo(0, h * 0.3364028);
    path.cubicTo(w * 0.1203226, h * 0.3559585, w * 0.3731767, h * 0.4742632,
        w * 0.5023256, h * 0.8113208);
    path.cubicTo(w * 0.5490186, h * 0.9331849, w * 0.6196209, h * 0.9873208,
        w * 0.6979465, h);
    path.lineTo(w * 0.7771256, h);
    path.cubicTo(w * 0.8537605, h * 0.9889906, w * 0.9325116, h * 0.9490755, w,
        h * 0.9019745);
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    path.lineTo(0, h * 0.3364028);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(HeadClipperPath oldClipper) {
    return false;
  }
}
