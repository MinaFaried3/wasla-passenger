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
  });

  final GlobalKey<FormState> namesFormKey;
  final TextEditingController usernameController;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;

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
              lastnameController: lastnameController),
        ),
        Padding(
          padding: edgeInsetsBottom,
          child: BlocBuilder<UsernameValidatorCubit, UsernameValidatorState>(
            builder: (context, state) {
              return AppTextFormField(
                controller: usernameController,
                textDirection: TextDirection.ltr,
                textInputAction: TextInputAction.next,
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
                suffix: state.when(initial: () {
                  return null;
                }, loading: () {
                  return const CircularProgressIndicator();
                }, valid: () {
                  return SvgPicture.asset(
                    AssetsProvider.doneIcon,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.tealPrimary500.withOpacity(AppSize.s0_9),
                      BlendMode.srcIn,
                    ),
                  );
                }, notValid: (message) {
                  return Icon(
                    Icons.error_outline,
                    color: ColorsManager.error,
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
