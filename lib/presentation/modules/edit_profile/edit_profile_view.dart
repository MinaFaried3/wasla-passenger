import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:wasla/presentation/modules/edit_profile/widgets/birthdate_input.dart';
import 'package:wasla/presentation/modules/edit_profile/widgets/gender_drop_down_menu.dart';
import 'package:wasla/presentation/modules/edit_profile/widgets/profile_image_picker_and_bear.dart';
import 'package:wasla/presentation/modules/home/profile/cubit/profile_cubit.dart';
import 'package:wasla/presentation/modules/register/widgets/contacts_form_fields.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';
import 'package:wasla/presentation/widgets/buttons/back_button.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';

import '../register/widgets/names_form_fields.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin {
  late final AnimationController namesAnimationController,
      contactsAnimationController,
      genderDateAnimationController,
      buttonAnimationController;

  late final Animation<Offset> namesAnimation,
      contactsAnimation,
      genderDateAnimation,
      buttonAnimation;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> contactsFormKey = GlobalKey<FormState>();

  late final RiveControllerManager riveController;

  @override
  void initState() {
    super.initState();
    riveController = context.read<BearAnimationCubit>().riveController;

    initAnimation();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.editProfile.tr()),
        leading: AppBackButton(
          action: () => context.read<ProfileCubit>().getProfile(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.all,
              child: FutureBuilder<PassengerModel>(
                future: getIt<LocalDataSource>().getPassengerModel(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    initInputs(snapshot);
                  }

                  return Column(
                    children: [
                      ProfileImagePickerAndBear(riveController: riveController),
                      SlideTransition(
                        position: namesAnimation,
                        child: NamesFormFields(
                          namesFormKey: namesFormKey,
                          usernameController: usernameController,
                          firstnameController: firstnameController,
                          lastnameController: lastnameController,
                          withDialog: false,
                        ),
                      ),
                      SlideTransition(
                        position: contactsAnimation,
                        child: ContactsFormFields(
                          contactsFormKey: contactsFormKey,
                          phoneController: phoneController,
                          emailController: emailController,
                          withDialog: false,
                        ),
                      ),
                      SlideTransition(
                        position: genderDateAnimation,
                        child: const Row(
                          children: [
                            Expanded(flex: 7, child: BirthdateInput()),
                            HorizontalSpace(10),
                            Expanded(flex: 4, child: GenderDropDownMenu()),
                          ],
                        ),
                      ),
                      VerticalSpace(50.h),
                      SlideTransition(
                        position: buttonAnimation,
                        child: BlocConsumer<EditProfileCubit, EditProfileState>(
                            listener: editProfileListener,
                            builder: (context, state) {
                              return state.maybeWhen(
                                  loading: () => LoadingButton.loading(),
                                  orElse: () => LoadingButton(
                                        onPressed: () {
                                          onPressed(context);
                                        },
                                        text: AppStrings.editProfile.tr(),
                                      ));
                            }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    context.read<EditProfileCubit>().editProfileRequest =
        context.read<EditProfileCubit>().editProfileRequest.copyWith(
              firstname: firstnameController.text,
              lastname: lastnameController.text,
              username: usernameController.text,
              phone: phoneController.text,
              email: emailController.text,
            );

    context.read<EditProfileCubit>().editProfile();
  }

  void editProfileListener(BuildContext context, EditProfileState state) {
    state.whenOrNull(
      editProfileFailure: (message) {
        context
            .read<BearAnimationCubit>()
            .riveController
            .addStates([BearState.fail, BearState.idle]);
        showAppToast(message);
      },
      editProfileSuccess: () => context
          .read<BearAnimationCubit>()
          .riveController
          .addStates([BearState.success, BearState.idle]),
    );
  }

  void initInputs(AsyncSnapshot<PassengerModel> snapshot) {
    usernameController.text = snapshot.data?.userName ?? '';
    firstnameController.text = snapshot.data?.firstName ?? '';
    lastnameController.text = snapshot.data?.lastName ?? '';
    emailController.text = snapshot.data?.connections.email ?? '';
    phoneController.text = snapshot.data?.connections.phone ?? '';
  }

  void initAnimation() {
    namesAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s2);
    contactsAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s3);
    genderDateAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s4);
    buttonAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s5);

    namesAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: namesAnimationController, curve: Curves.ease));
    contactsAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: contactsAnimationController, curve: Curves.ease));
    genderDateAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: genderDateAnimationController, curve: Curves.ease));
    buttonAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: buttonAnimationController, curve: Curves.ease));

    namesAnimationController.forward();
    contactsAnimationController.forward();
    genderDateAnimationController.forward();
    buttonAnimationController.forward();
  }

  void _dispose() {
    namesAnimationController.dispose();
    contactsAnimationController.dispose();
    genderDateAnimationController.dispose();
    buttonAnimationController.dispose();
  }
}
