import 'package:rive/rive.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/constants.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/presentation/widgets/bear_clip_bath.dart';

class AnimatedBear extends StatelessWidget {
  const AnimatedBear(
      {super.key, required this.riveController, required this.responsive});

  final RiveControllerManager riveController;
  final ResponsiveManager responsive;

  @override
  Widget build(BuildContext context) {
    final double radius = responsive.screenWidth * AppSize.s0_3;
    final double diameter = radius * 2;
    const double xCoordinate = AppConstants.doubleZero;
    final double yCoordinate = (diameter) * 0.2;
    const double zCoordinate = AppConstants.doubleZero;
    return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Transform(
              transform: Matrix4.translation(Vector3(
                xCoordinate,
                yCoordinate,
                zCoordinate,
              )),
              child: ClipPath(
                clipper: BearClipper(),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Rive(
                    artboard: riveController.riveArtBoard!,
                    fit: BoxFit.contain,
                    enablePointerEvents: true,
                    useArtboardSize: true,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
