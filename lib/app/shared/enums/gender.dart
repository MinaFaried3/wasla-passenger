import 'package:wasla/app/shared/common/common_libs.dart';

import '../../../generated/app_image.dart';

enum Gender {
  male(iconPath: Assets.svgMaleIcon, str: AppStrings.male),
  female(iconPath: Assets.svgFemaleIcon, str: AppStrings.female);

  final String iconPath;
  final String str;

  const Gender({required this.iconPath, required this.str});
}
