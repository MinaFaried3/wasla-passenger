import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:wasla/presentation/widgets/bear/animated_bear.dart';

class ProfileImagePickerAndBear extends StatefulWidget {
  const ProfileImagePickerAndBear({
    super.key,
    required this.riveController,
  });

  final RiveControllerManager riveController;

  @override
  State<ProfileImagePickerAndBear> createState() =>
      _ProfileImagePickerAndBearState();
}

class _ProfileImagePickerAndBearState extends State<ProfileImagePickerAndBear>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> profileAnimation;
  late final Animation<Offset> bearAnimation;
  late final Animation<double> bearOpacity;

  String imageUrl = AppConstants.defaultProfileImageUrl;

  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SlideTransition(
          position: profileAnimation,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border:
                      Border.all(color: ColorsManager.tealPrimary, width: 2)),
              child: FutureBuilder<PassengerModel>(
                future: getIt<LocalDataSource>().getPassengerModel(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    imageUrl = snapshot.data?.profile ??
                        AppConstants.defaultProfileImageUrl;
                  }

                  return GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: ConditionalBuilder(
                        condition: _image != null,
                        onTrue: (context) => Image.file(
                          _image!,
                          height: 175,
                          width: 175,
                          fit: BoxFit.cover,
                        ),
                        onFalse: (context) => Image.network(
                          imageUrl,
                          height: 175,
                          width: 175,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Flexible(
            child: SlideTransition(
                position: bearAnimation,
                child: FadeTransition(
                    opacity: bearOpacity,
                    child:
                        AnimatedBear(riveController: widget.riveController)))),
      ],
    );
  }

  void init() {
    animationController =
        AnimationController(vsync: this, duration: DurationManager.s4);
    profileAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));
    bearAnimation = Tween<Offset>(begin: const Offset(0, 2.5), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    bearOpacity =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animationController.forward();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        context.read<EditProfileCubit>().editProfileRequest = context
            .read<EditProfileCubit>()
            .editProfileRequest
            .copyWith(profileImage: _image);
      } else {
        print('No image selected.');
      }
    });
  }
}
