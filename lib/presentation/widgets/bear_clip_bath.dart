import 'package:wasla/app/shared/common/common_libs.dart';

class BearClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    final path = Path();
    final double clipUntil = size.height * 0.81;

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, clipUntil);
    path.lineTo(0, clipUntil);
    path.lineTo(0, 0);

    return path;
  }
}
