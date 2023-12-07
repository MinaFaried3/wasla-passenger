import 'package:flutter/services.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.textDirection,
    this.textInputType,
    this.onTap,
    this.onFieldSubmitted,
    this.hintText,
    this.prefix,
    this.suffix,
    this.outSideIcon,
    this.svgPrefixPath,
    this.labelText,
    this.textInputAction,
    this.autofillHints,
    this.textCapitalization,
    this.inputFormatters,
  });

  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final String? svgPrefixPath;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? outSideIcon;
  final Iterable<String>? autofillHints;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return textDirection == null
        ? _buildTextFormField(context)
        : Directionality(
            textDirection: textDirection!,
            child: _buildTextFormField(context),
          );
  }

  Widget _buildTextFormField(context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      obscuringCharacter: '●',
      autofillHints: autofillHints,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      inputFormatters: inputFormatters,
      maxLength: _getFieldLength(),
      cursorOpacityAnimates: true,
      cursorWidth: AppSize.s1,
      //todo
      // todo add english family
      style: getRegularStyle(
          color: ColorsManager.offWhite400, fontSize: AppSize.s28),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppPadding.p14,
          horizontal: AppPadding.p8,
        ),
        counterStyle: getMediumStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: FontSize.s16),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(AppPadding.p6),
          child: svgPrefixPath != null
              ? SvgPicture.asset(
                  svgPrefixPath!,
                  width: AppSize.s10,
                  height: AppSize.s10,
                  colorFilter: ColorFilter.mode(
                    ColorsManager.offWhite300.withOpacity(AppSize.s0_9),
                    BlendMode.srcIn,
                  ),
                )
              : null,
        ),
        suffixIcon: suffix,
        alignLabelWithHint: true,
        icon: outSideIcon,
        filled: true,
        fillColor: ColorsManager.tealPrimary1000,
        hintText: hintText,
        labelStyle: getRegularStyle(
            color: ColorsManager.offWhite500.withOpacity(AppSize.s0_75),
            fontSize: FontSize.s20),
        label: labelText != null
            ? Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p4,
                  horizontal: AppPadding.p6,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.tealPrimary1000,
                  borderRadius: BorderRadius.circular(AppSize.s20),
                ),
                child: FittedBox(child: Text(labelText!)),
              )
            : null,
        hintStyle: getRegularStyle(
            color: ColorsManager.offWhite500.withOpacity(AppSize.s0_75),
            fontSize: AppSize.s28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: BorderSide.none,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
            borderSide: const BorderSide(
                color: ColorsManager.darkTealBackground900, width: AppSize.s2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
            borderSide: const BorderSide(
                color: ColorsManager.darkTealBackground900, width: AppSize.s2)),
      ),
      cursorColor: ColorsManager.tealPrimary,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
    );
  }

  int? _getFieldLength() {
    if (textInputType != TextInputType.phone) {
      return null;
    }

    return AppConstants.phoneNumberLength;
  }
}
