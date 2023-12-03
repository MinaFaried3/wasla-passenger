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
          Padding(
            padding: EdgeInsets.only(
                top: _isDone() ? 0 : responsive.screenHeight * AppSize.s0_015),
            child: SvgPicture.asset(
              _isDone()
                  ? AssetsProvider.doneIcon
                  : AssetsProvider.arrowDown1Icon,
              fit: _isDone() ? BoxFit.scaleDown : BoxFit.contain,
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
