import 'package:wasla/app/shared/common/common_libs.dart';

class FromToInputsFields extends StatefulWidget {
  const FromToInputsFields({
    super.key,
  });

  @override
  State<FromToInputsFields> createState() => _FromToInputsFieldsState();
}

class _FromToInputsFieldsState extends State<FromToInputsFields>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _fromAnimation;
  late Animation<Offset> _toAnimation;

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  final FocusNode fromFocusNode = FocusNode();
  final FocusNode toFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: DurationManager.s2);
    _fromAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));
    _toAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic =
        Localizations.localeOf(context) == LocalizationManager.arabicLocal;
    return Row(
      children: [
        Expanded(
            child: SlideTransition(
          position: isArabic ? _fromAnimation : _toAnimation,
          child: AppTextFormField(
            controller: fromController,
            focusNode: fromFocusNode,
            labelText: AppStrings.from.tr(),
            textAlign: TextAlign.center,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (fromText) {
              _focusNextField(context, fromFocusNode, toFocusNode);
            },
          ),
        )),
        IconButton(
            onPressed: flipOnPressed,
            icon: AppSvg(
              path: AssetsProvider.flipIcon,
              height: 30.sp,
              color: ColorsManager.tealPrimary300,
            )),
        Expanded(
            child: SlideTransition(
          position: isArabic ? _toAnimation : _fromAnimation,
          child: AppTextFormField(
            controller: toController,
            focusNode: toFocusNode,
            labelText: AppStrings.to.tr(),
            textAlign: TextAlign.center,
            floatingLabelAlignment: FloatingLabelAlignment.center,
          ),
        )),
      ],
    );
  }

  void _dispose() {
    _animationController.dispose();
    fromController.dispose();
    toController.dispose();
    fromFocusNode.dispose();
    toFocusNode.dispose();
  }

  void flipOnPressed() {
    setState(() {
      String fromText = fromController.text;
      String toText = toController.text;

      fromController.text = toText;
      toController.text = fromText;
    });
  }

  void _focusNextField(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus(); // Hide the keyboard
    FocusScope.of(context)
        .requestFocus(nextFocus); // Move focus to the next field
  }
}
