import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';

class NamesFields extends StatelessWidget {
  const NamesFields({
    super.key,
    required this.firstnameController,
    required this.lastnameController,
    required this.lastnameFocusNode,
  });

  final TextEditingController firstnameController;
  final TextEditingController lastnameController;

  //todo
  final FocusNode lastnameFocusNode;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    const autoFill = [
      AutofillHints.name,
      AutofillHints.namePrefix,
      AutofillHints.nameSuffix
    ];
    return Row(
      textDirection: TextDirection.ltr,
      children: [
        Expanded(
          child: AppTextFormField(
            controller: firstnameController,
            labelText: AppStrings.firstname.tr(),
            svgPrefixPath: AssetsProvider.userIcon,
            textInputAction: TextInputAction.next,
            textDirection: TextDirection.ltr,
            autofillHints: autoFill,
            textCapitalization: TextCapitalization.words,
            validator: _validateNotEmpty,
            onFieldSubmitted: (name) => _onFieldSubmitted(context),
            onChanged: (name) => _onChangeFirstname(name, context),
          ),
        ),
        //space
        responsive.widthSpace(AppSize.s1),

        Expanded(
          child: AppTextFormField(
            controller: lastnameController,
            focusNode: lastnameFocusNode,
            labelText: AppStrings.lastname.tr(),
            svgPrefixPath: AssetsProvider.userIcon,
            textInputAction: TextInputAction.next,
            textDirection: TextDirection.ltr,
            autofillHints: autoFill,
            textCapitalization: TextCapitalization.words,
            validator: _validateNotEmpty,
            onFieldSubmitted: (name) => _onFieldSubmitted(context),
            onChanged: (name) => _onChangeLastname(name, context),
          ),
        ),
      ],
    );
  }

  String? _validateNotEmpty(String? name) {
    if (name == null || name.isEmpty) {
      return AppStrings.cannotBeEmpty.tr();
    }
    return null;
  }

  void _onFieldSubmitted(BuildContext context) {
    context
        .read<BearAnimationCubit>()
        .riveController
        .addState(BearState.lookIdle);
  }

  void _onChangeFirstname(String name, BuildContext context) {
    context
        .read<BearAnimationCubit>()
        .riveController
        .followFieldText(value: name);
  }

  void _onChangeLastname(String name, BuildContext context) {
    context
        .read<BearAnimationCubit>()
        .riveController
        .followRightSideFieldText(value: name);
  }
}
