import 'package:lottie/lottie.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:wasla/app/shared/common/common_libs.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    const double xCoordinate = AppConstants.doubleZero;
    const double yCoordinate = AppConstants.doubleZero;
    const double zCoordinate = AppConstants.doubleZero;
    return Center(
      child: Transform(
        transform: Matrix4.translation(Vector3(
          xCoordinate,
          yCoordinate,
          zCoordinate,
        )),
        child: ClipPath(
          clipper: LoadingClipper(),
          child: Lottie.asset(
            AssetsProvider.loadingIndicator,
            width: width ?? 200.w,
            height: height,
          ),
        ),
      ),
    );
  }
}

class LoadingClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    final path = Path();

    final double width = size.width;
    final double height = size.height;

    final double clipUntil3 = height * AppSize.s0_32;
    final double clipUntil7 = height * AppSize.s0_7;

    path.moveTo(0, clipUntil3);
    path.lineTo(width, clipUntil3);
    path.lineTo(width, clipUntil7);
    path.lineTo(0, clipUntil7);
    path.lineTo(0, clipUntil3);

    return path;
  }
}

class LoadingClipperRect extends CustomClipper<Rect> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, size.height * 0.5, size.width, size.height * 0.5);
  }
}
