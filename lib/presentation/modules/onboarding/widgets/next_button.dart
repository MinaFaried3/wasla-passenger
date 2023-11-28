import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/custom_progress_indicator.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.itemsCount,
    required this.index,
  });

  final int itemsCount;
  final int index;

  bool _isDone() {
    return index == itemsCount - 1;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    const Color iconColor = ColorsManager.offWhite;
    return SizedBox(
      width: responsive.screenWidth * AppSize.s2,
      height: responsive.screenWidth * AppSize.s2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BlocBuilder<OnChangeOnBoardingPageCubit, OnChangeOnBoardingPageState>(
            builder: (context, state) {
              if (state is OnChangeOnBoardingPage) {
                return CustomProgressIndicator(
                  currIndex: ((state.index + 1) / itemsCount),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          //icon
          if (_isDone())
            Icon(
              Icons.done,
              color: iconColor,
              size: responsive.screenWidth * AppSize.s0_075,
            )
          else
            Padding(
              padding: EdgeInsets.only(
                  top: responsive.screenHeight * AppSize.s0_015),
              child: SvgPicture.asset(
                AssetsProvider.arrowDown1Icon,
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
