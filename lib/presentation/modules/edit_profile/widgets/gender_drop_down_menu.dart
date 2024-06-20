import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/enums/gender.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/generated/app_image.dart';
import 'package:wasla/presentation/modules/edit_profile/cubit/edit_profile_cubit.dart';

class GenderDropDownMenu extends StatefulWidget {
  const GenderDropDownMenu({
    super.key,
  });

  @override
  State<GenderDropDownMenu> createState() => _GenderDropDownMenuState();
}

class _GenderDropDownMenuState extends State<GenderDropDownMenu> {
  Gender? gender;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PassengerModel>(
      future: getIt<LocalDataSource>().getPassengerModel(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          gender = switch (snapshot.data?.gender ?? Gender.male.name) {
            AppStrings.female => Gender.female,
            _ => Gender.male
          };
        }

        return Directionality(
          textDirection: TextDirection.ltr,
          child: DropdownButtonFormField<Gender>(
            value: gender,
            onChanged: (newGender) {
              gender = newGender ?? Gender.male;
              context.read<EditProfileCubit>().editProfileRequest = context
                  .read<EditProfileCubit>()
                  .editProfileRequest
                  .copyWith(gender: gender?.name ?? Gender.male.name);
            },
            borderRadius: BorderRadius.circular(20),
            elevation: 20,
            style: getBoldStyle(fontSize: 16),
            iconSize: 0,
            isDense: true,
            alignment: Alignment.center,
            dropdownColor: ColorsManager.darkTeal,
            decoration: buildInputDecoration(),
            items: Gender.values
                .map<DropdownMenuItem<Gender>>((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        AppSvg(
                          path: e.iconPath,
                          height: 30,
                          color: ColorsManager.tealPrimary500,
                        ),
                        Text(e.str.tr()),
                      ],
                    )))
                .toList(),
          ),
        );
      },
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        isDense: true,
        isCollapsed: false,
        prefixIcon: Padding(
          padding: EdgeInsets.all(AppPadding.p6.sp),
          child: SvgPicture.asset(
            Assets.svgMaleFemaleIcon,
            matchTextDirection: true,
            width: AppSize.s10.sp,
            height: AppSize.s10.sp,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorsManager.offWhite.withOpacity(AppSize.s0_9),
              BlendMode.srcIn,
            ),
          ),
        ),
        label: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p4.h,
            horizontal: AppPadding.p6.w,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.tealPrimary1000,
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          child: FittedBox(child: Text(AppStrings.gender.tr())),
        ));
  }
}
