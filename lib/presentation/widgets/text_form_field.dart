import 'package:wasla/app/shared/common/common_libs.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.textDirection,
  });

  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      textDirection: textDirection,
      decoration: const InputDecoration(),
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
