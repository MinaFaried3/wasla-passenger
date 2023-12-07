import 'package:wasla/app/shared/common/common_libs.dart';

class NamesFields extends StatelessWidget {
  const NamesFields({
    super.key,
    required this.firstnameController,
    required this.lastnameController,
    required this.lastnameFocusNode,
  });

  final TextEditingController firstnameController;
  final TextEditingController lastnameController;

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
            validator: _validateNotEmpty,
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
              validator: _validateNotEmpty),
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
}
