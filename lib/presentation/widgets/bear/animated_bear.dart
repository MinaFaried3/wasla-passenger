import 'package:rive/rive.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/widgets/bear/bear_clip_bath.dart';

class AnimatedBear extends StatelessWidget {
  const AnimatedBear({super.key, required this.riveController});

  final RiveControllerManager riveController;

  @override
  Widget build(BuildContext context) {
    final ContextManager responsive = ContextManager(context, hasAppBar: false);
    // final double radius = responsive.screenWidth * AppSize.s0_3;
    // final double diameter = radius * 2;
    const double xCoordinate = AppConstants.doubleZero;
    const double yCoordinate = 45;
    const double zCoordinate = AppConstants.doubleZero;
    return SizedBox(
      width: responsive.getWidthPercentage(60),
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
            child: BlocBuilder<BearAnimationCubit, BearAnimationState>(
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () => const LoadingIndicator(),
                    orElse: () => Rive(
                          artboard: riveController.riveArtBoard!,
                          fit: BoxFit.contain,
                          enablePointerEvents: true,
                          useArtboardSize: true,
                          alignment: Alignment.topCenter,
                        ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
