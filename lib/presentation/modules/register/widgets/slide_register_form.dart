import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/register/controller/form_controller.dart';
import 'package:wasla/presentation/modules/register/cubit/form_index_cubit.dart';
import 'package:wasla/presentation/modules/register/widgets/contacts_form_fields.dart';
import 'package:wasla/presentation/modules/register/widgets/form_controller_indicator.dart';
import 'package:wasla/presentation/modules/register/widgets/names_form_fields.dart';
import 'package:wasla/presentation/modules/register/widgets/password_form_fields.dart';

class SlideRegisterForm extends StatefulWidget {
  final RiveControllerManager riveController;

  const SlideRegisterForm({
    super.key,
    required this.riveController,
  });

  @override
  State<SlideRegisterForm> createState() => _SlideRegisterFormState();
}

class _SlideRegisterFormState extends State<SlideRegisterForm>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _formAnimationController;
  late final Animation<double> _sizedAnimation;
  late final Animation<Offset> _offsetFromAnimation;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  //todo
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode lastnameFocusNode = FocusNode();

  //form keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> contactsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  late final List<FormViewContent> forms;

  @override
  void initState() {
    super.initState();

    forms = [
      //names form fields
      FormViewContent(
        key: namesFormKey,
        form: NamesFormFields(
          namesFormKey: namesFormKey,
          usernameController: usernameController,
          lastnameController: lastnameController,
          firstnameController: firstnameController,
          lastnameFocusNode: lastnameFocusNode,
          usernameFocusNode: usernameFocusNode,
        ),
      ),

      //contacts
      FormViewContent(
        key: contactsFormKey,
        form: ContactsFormFields(
          contactsFormKey: contactsFormKey,
          emailController: emailController,
          phoneController: phoneController,
        ),
      ),

      //password
      FormViewContent(
        key: passwordFormKey,
        form: PasswordFormFields(
          passwordFormKey: passwordFormKey,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
        ),
      ),
    ];

    _addFocusNodesListeners();
    _initAnimation();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _initAnimation() {
    //todo
    _animationController =
        AnimationController(vsync: this, duration: DurationManager.m500);
    _formAnimationController =
        AnimationController(vsync: this, duration: DurationManager.m500);

    _sizedAnimation = Tween<double>(
            begin: AppConstants.doubleZero, end: AppConstants.doubleOne)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //container padding and radius
    const double containerPadding = AppPadding.p8;
    const double containerRadius = containerPadding + AppSize.s20;

    //return
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
            color: ColorsManager.darkTeal,
            borderRadius: BorderRadius.circular(containerRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FormIndexCubit, int>(
              builder: (context, formIndex) {
                return ScaleTransition(
                  alignment: Alignment.bottomCenter,
                  scale: _sizedAnimation,
                  child: forms[formIndex].form,
                );
              },
            ),
            BlocBuilder<FormIndexCubit, int>(
              builder: (context, formIndex) {
                return FormControllerIndicator(
                  animationController: _animationController,
                  currentFromKey: forms[formIndex].key,
                  length: forms.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //todo
  void _dispose() {
    //remove listener
    passwordFocusNode.removeListener(_passwordFocusNodeListener);
    usernameFocusNode.removeListener(_usernameListener);
    lastnameFocusNode.removeListener(_lastnameListener);

    //dispose nodes
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    lastnameFocusNode.dispose();

    //dispose controllers
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    //animation
    _animationController.dispose();
    _formAnimationController.dispose();
  }

  void _addFocusNodesListeners() {
    passwordFocusNode.addListener(_passwordFocusNodeListener);
    usernameFocusNode.addListener(_usernameListener);
    lastnameFocusNode.addListener(_lastnameListener);
  }

  void _passwordFocusNodeListener() {
    if (passwordFocusNode.hasFocus || confirmPasswordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsUp);
    } else if (!passwordFocusNode.hasFocus ||
        !confirmPasswordFocusNode.hasFocus) {
      widget.riveController.addState(BearState.handsDown);
    }
  }

  void _usernameListener() {
    if (usernameFocusNode.hasFocus) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.usernameInfo);
    }
  }

  void _lastnameListener() {
    if (lastnameFocusNode.hasFocus) {
      context.read<BearDialogCubit>().writeMessage(AppStrings.lastnameInfo);
    }
  }
}
