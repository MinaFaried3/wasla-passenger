part of 'package:wasla/presentation/modules/onboarding/cubit/onboarding_cubit.dart';

class OnboardingPages {
  late final List<OnboardingModel> pagesData;
  late final List<Color> pagesColors;
  late final int itemsCount;

  OnboardingPages() {
    pagesData = _getPagesData();
    pagesColors = _getPagesColors();
    itemsCount = _getItemsCount();
  }

  int get currPageIndex => _currPageIndex;
  int _currPageIndex = 0;

  void nextPageIndex() {
    _currPageIndex++;
  }

  OnboardingModel getOnboardingPageData(int index) => pagesData[index];

  List<OnboardingModel> _getPagesData() => [
        OnboardingModel(
            title: AppStrings.onboardingTitle1.tr(),
            subTitle: AppStrings.onboardingSubTitle1.tr(),
            bgColor: ColorsManager.darkTealBackground2,
            nextColor: ColorsManager.tealPrimary1000,
            image: AssetsProvider.onboarding1),
        OnboardingModel(
            title: AppStrings.onboardingTitle2.tr(),
            subTitle: AppStrings.onboardingSubTitle2.tr(),
            bgColor: ColorsManager.tealPrimary1000,
            nextColor: ColorsManager.darkTealBackground2,
            image: AssetsProvider.onboarding2),
        OnboardingModel(
            title: AppStrings.onboardingTitle3.tr(),
            subTitle: AppStrings.onboardingSubTitle3.tr(),
            bgColor: ColorsManager.darkTealBackground2,
            nextColor: ColorsManager.tealPrimary1000,
            image: AssetsProvider.onboarding3),
        OnboardingModel(
            title: AppStrings.onboardingTitle4.tr(),
            subTitle: AppStrings.onboardingSubTitle4.tr(),
            bgColor: ColorsManager.tealPrimary1000,
            nextColor: ColorsManager.darkTealBackground2,
            image: AssetsProvider.onboarding4),
        OnboardingModel(
            title: AppStrings.onboardingTitle5.tr(),
            subTitle: AppStrings.onboardingSubTitle5.tr(),
            bgColor: ColorsManager.darkTealBackground2,
            nextColor: ColorsManager.tealPrimary1000,
            image: AssetsProvider.onboarding5),
        OnboardingModel(
            title: AppStrings.onboardingTitle6.tr(),
            subTitle: AppStrings.onboardingSubTitle6.tr(),
            bgColor: ColorsManager.tealPrimary1000,
            nextColor: ColorsManager.darkTealBackground2,
            image: AssetsProvider.onboarding6),
      ];

  List<Color> _getPagesColors() =>
      pagesData.map((page) => page.bgColor).toList();

  int _getItemsCount() => pagesData.length;
}
