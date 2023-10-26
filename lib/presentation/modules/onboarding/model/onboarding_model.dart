part of 'package:wasla/presentation/modules/onboarding/cubit/onboarding_cubit.dart';

class OnboardingModel extends Equatable {
  final String title;
  final String subTitle;
  final Color bgColor;
  final Color textColor;
  final String image;

  const OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.bgColor,
    required this.textColor,
    required this.image,
  });

  @override
  List<Object> get props => [
        title,
        subTitle,
        bgColor,
        textColor,
        image,
      ];
}
