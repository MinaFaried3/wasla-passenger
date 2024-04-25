import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/start_now/widgets/stack_clip_path.dart';

class BottomCurvedWidget extends StatelessWidget {
  final ContextManager responsive;
  final double size;
  final Widget? child;

  const BottomCurvedWidget({
    super.key,
    required this.responsive,
    required this.size,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ContainerClipper(),
      child: Container(
        color: ColorsManager.offWhite100.withOpacity(AppSize.s0_2),
        height: responsive.screenHeight * size,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: child,
      ),
    );
  }
}
