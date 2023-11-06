import '../resources/common/common_libs.dart';

class ContainerClipper extends CustomClipper<Path> {
  Path path = Path();

  @override
  Path getClip(Size size) {
    var firstStart = Offset(0, size.height);
    var firstEnd = Offset(0, size.height * 0.75);

    path.quadraticBezierTo(
      firstStart.dx,
      firstStart.dy,
      firstEnd.dx,
      firstEnd.dy,
    );
    var secondStart = Offset(size.width * 0.5, size.height * 0.2);
    var secondEnd = Offset(size.width, size.height * 0.75);

    path.quadraticBezierTo(
      secondStart.dx,
      secondStart.dy,
      secondEnd.dx,
      secondEnd.dy,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
