import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/register/cubit/username_valdiator/username_validation_cubit.dart';
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
          child: BlocBuilder<UsernameValidatorCubit, UsernameValidatorState>(
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
                onChanged: (username) {
                  context.read<UsernameValidatorCubit>().validate(username);
                },
                onFieldSubmitted: (username) {
                  state.maybeWhen(
                      valid: () {},
                      orElse: () {
                        context
                            .read<UsernameValidatorCubit>()
                            .validate(username);
                      });
                },
                validator: (username) {
                  return state.whenOrNull(notValid: (message) {
                    return message;
                  });

                  //todo
                  return username == null || username.length < 3
                      ? 'غير صالح'
                      : null;
                },
                suffix: state.maybeWhen(initial: () {
                  return null;
                }, loading: () {
                  return const Padding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    child: CircularProgressIndicator(
                      strokeWidth: AppSize.s1,
                    ),
                  );
                }, valid: () {
                  return SvgPicture.asset(
                    AssetsProvider.doneIcon,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.tealPrimary500.withOpacity(AppSize.s0_9),
                      BlendMode.srcIn,
                    ),
                  );
                }, orElse: () {
                  return SvgPicture.asset(
                    AssetsProvider.wifiIcon,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.red900.withOpacity(AppSize.s0_9),
                      BlendMode.srcIn,
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ]),
    );
  }
}
