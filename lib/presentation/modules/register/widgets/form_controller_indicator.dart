import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/register/bloc/check_username_bloc.dart';
import 'package:wasla/presentation/modules/register/cubit/form_index_cubit.dart';

class FormControllerIndicator extends StatefulWidget {
  const FormControllerIndicator(
      {super.key,
      required this.animationController,
      required this.currentFromKey,
      required this.length});

  final AnimationController animationController;
  final GlobalKey<FormState> currentFromKey;
  final int length;

  @override
  State<FormControllerIndicator> createState() =>
      _FormControllerIndicatorState();
}

class _FormControllerIndicatorState extends State<FormControllerIndicator> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return BlocBuilder<FormIndexCubit, int>(
      builder: (context, formIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              _buildGoBackButton(context),
              _buildGoNextButton(formIndex, context),
              const Spacer(),
              _buildIndicator(formIndex, context, responsive)
            ],
          ),
        );
      },
    );
  }

  Widget _buildIndicator(
      int formIndex, BuildContext context, ResponsiveManager responsive) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: AnimatedSmoothIndicator(
        activeIndex: formIndex,
        count: widget.length,
        textDirection: TextDirection.ltr,
        duration: DurationManager.m500,
        curve: Curves.ease,
        effect: WormEffect(
          activeDotColor: Theme.of(context).colorScheme.onTertiaryContainer,
          dotColor: ColorsManager.grey500,
          dotHeight: responsive.getScreenHeightPercentage(AppSize.s1_5),
          radius: responsive.getWidthPercentage(AppSize.s1),
          spacing: responsive.getWidthPercentage(AppSize.s1),
          dotWidth: responsive.getWidthPercentage(AppSize.s3),
          type: WormType.thin,
          paintStyle: PaintingStyle.stroke,
        ),
      ),
    );
  }

  IconButton _buildGoNextButton(int formIndex, BuildContext context) {
    return IconButton(
        onPressed: () {
          if (_validateFormBeforeGoNext(formIndex) == false) {
            return;
          }
          bool goNext = context.read<FormIndexCubit>().nextForm();
          _startAnimation(goNext);
        },
        icon: SvgPicture.asset(
          AssetsProvider.arrowRightIcon,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onTertiaryContainer,
            BlendMode.srcIn,
          ),
        ));
  }

  IconButton _buildGoBackButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        bool goBack = context.read<FormIndexCubit>().previousForm();
        _startAnimation(goBack);
      },
      icon: SvgPicture.asset(
        AssetsProvider.arrowLeftIcon,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onTertiaryContainer,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  bool _validateFormBeforeGoNext(int formIndex) {
    if (widget.currentFromKey.currentState?.validate() == false ||
        (formIndex == 0 && !_validateNamesForm())) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.makeSureToGoNext);
      context
          .read<BearAnimationCubit>()
          .riveController
          .addState(BearState.lookIdle);
      context
          .read<BearAnimationCubit>()
          .riveController
          .addState(BearState.fail);

      return false;
    }
    return true;
  }

  void _startAnimation(bool start) {
    if (start) {
      widget.animationController.reset();
      widget.animationController.forward();
    }
  }

  bool _validateNamesForm() {
    return context.read<CheckUsernameBloc>().valid;
  }
}
