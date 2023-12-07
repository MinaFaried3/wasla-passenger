import 'package:wasla/app/services/validator/validator_input_formater.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/modules/register/bloc/check_username_bloc.dart';
import 'package:wasla/presentation/modules/register/widgets/names_widget.dart';

class NamesFormFields extends StatefulWidget {
  const NamesFormFields({
    super.key,
    required this.namesFormKey,
    required this.usernameController,
    required this.firstnameController,
    required this.lastnameController,
    required this.lastnameFocusNode,
    required this.usernameFocusNode,
  });

  final GlobalKey<FormState> namesFormKey;
  final TextEditingController usernameController;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final FocusNode lastnameFocusNode;
  final FocusNode usernameFocusNode;

  @override
  State<NamesFormFields> createState() => _NamesFormFieldsState();
}

class _NamesFormFieldsState extends State<NamesFormFields>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_03);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);
    return Form(
      key: widget.namesFormKey,
      child: Column(children: [
        // name fields (first and last)
        Padding(
          padding: edgeInsetsBottom,
          child: NamesFields(
            firstnameController: widget.firstnameController,
            lastnameController: widget.lastnameController,
            lastnameFocusNode: widget.lastnameFocusNode,
          ),
        ),
        Padding(
          padding: edgeInsetsBottom,
          child: BlocConsumer<CheckUsernameBloc, CheckUsernameState>(
            listener: (context, state) => _startAnimation(),
            builder: (context, state) {
              return AppTextFormField(
                controller: widget.usernameController,
                focusNode: widget.usernameFocusNode,
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.next,
                autofillHints: const [
                  AutofillHints.username,
                  AutofillHints.newUsername
                ],
                inputFormatters: [LowerCaseTextFormatter()],
                labelText: AppStrings.username.tr(),
                svgPrefixPath: AssetsProvider.userIcon,
                onChanged: (username) => _checkUsername(context, username),
                onFieldSubmitted: (username) {
                  state.maybeWhen(
                      valid: () {},
                      orElse: () => _checkUsername(context, username));
                },
                validator: (username) {
                  return state.whenOrNull(
                    notValid: (message) => message.tr(),
                    error: (failure) => failure.message,
                  );
                },
                suffix: ScaleTransition(
                  scale: _scaleAnimation,
                  child: state.maybeWhen(
                    initial: () => null,
                    loading: () => _loadingIndicator(),
                    valid: () => _validIcon(),
                    orElse: () => _notValidIcon(),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  SvgPicture _notValidIcon() {
    return SvgPicture.asset(
      AssetsProvider.errorIcon,
      fit: BoxFit.scaleDown,
      colorFilter: const ColorFilter.mode(
        ColorsManager.red700,
        BlendMode.srcIn,
      ),
    );
  }

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m500);
    _scaleAnimation = Tween<double>(
            begin: AppConstants.doubleZero, end: AppConstants.doubleOne)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
    ));
  }

  void _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  SvgPicture _validIcon() {
    return SvgPicture.asset(
      AssetsProvider.doneIcon,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        ColorsManager.tealPrimary300.withOpacity(AppSize.s0_9),
        BlendMode.srcIn,
      ),
    );
  }

  Padding _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(AppPadding.p16),
      child: SizedBox(
        width: AppSize.s4,
        height: AppSize.s4,
        child: CircularProgressIndicator(
          strokeWidth: AppSize.s1,
        ),
      ),
    );
  }

  void _checkUsername(BuildContext context, String username) {
    context
        .read<BearAnimationCubit>()
        .riveController
        .followFieldText(value: username);

    context.read<CheckUsernameBloc>().add(CheckUsernameEvent.check(username));
  }
}
