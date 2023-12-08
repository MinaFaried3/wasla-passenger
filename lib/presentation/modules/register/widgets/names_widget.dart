import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';

class NamesFields extends StatefulWidget {
  const NamesFields({
    super.key,
    required this.firstnameController,
    required this.lastnameController,
  });

  final TextEditingController firstnameController;
  final TextEditingController lastnameController;

  @override
  State<NamesFields> createState() => _NamesFieldsState();
}

class _NamesFieldsState extends State<NamesFields> {
  final FocusNode lastnameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    lastnameFocusNode.addListener(_lastnameListener);
  }

  @override
  void dispose() {
    lastnameFocusNode.removeListener(_lastnameListener);
    lastnameFocusNode.dispose();
    super.dispose();
  }

  void _lastnameListener() {
    if (lastnameFocusNode.hasFocus) {
      context
          .read<BearDialogCubit>()
          .writeMessage(AppStrings.lastnameInfo.tr());
    }
  }

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
            controller: widget.firstnameController,
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
            controller: widget.lastnameController,
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
