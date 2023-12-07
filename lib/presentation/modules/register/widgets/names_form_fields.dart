import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/register/bloc/check_username_bloc.dart';
import 'package:wasla/presentation/modules/register/widgets/names_widget.dart';

class NamesFormFields extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_03);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);
    return Form(
      key: namesFormKey,
      child: Column(children: [
        // name fields (first and last)
        Padding(
          padding: edgeInsetsBottom,
          child: NamesFields(
            firstnameController: firstnameController,
            lastnameController: lastnameController,
            lastnameFocusNode: lastnameFocusNode,
          ),
        ),
        Padding(
          padding: edgeInsetsBottom,
          child: BlocBuilder<CheckUsernameBloc, CheckUsernameState>(
            builder: (context, state) {
              return AppTextFormField(
                controller: usernameController,
                focusNode: usernameFocusNode,
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.next,
                autofillHints: const [
                  AutofillHints.username,
                  AutofillHints.newUsername
                ],
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
                suffix: state.maybeWhen(
                  initial: () => null,
                  loading: () => _loadingIndicator(),
                  valid: () => _validIcon(),
                  orElse: () => _notValidIcon(),
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
    context.read<CheckUsernameBloc>().add(CheckUsernameEvent.check(username));
  }
}
