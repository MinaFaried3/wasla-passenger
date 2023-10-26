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

  List<OnboardingModel> _getPagesData() => const [
        OnboardingModel(
          title: 'عنوان ريئسي',
          subTitle:
              'عنوان فرعي كتييييييير تسبي سبيتى سملىبنبثنحي سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين',
          bgColor: ColorManager.blackNavy,
          textColor: ColorManager.beige,
          image: ImageAssets.logo,
        ),
        OnboardingModel(
          title: 'عنوان ريئسي',
          subTitle:
              'عنوان فرعي كتييييييير تسبي سبيتى سملىبنبثنحي سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين',
          bgColor: ColorManager.beige,
          textColor: ColorManager.navy,
          image: ImageAssets.logoTitle,
        ),
        OnboardingModel(
          title: 'عنوان ريئسي',
          subTitle:
              'عنوان فرعي كتييييييير تسبي سبيتى سملىبنبثنحي سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين',
          bgColor: ColorManager.darkNavy,
          textColor: ColorManager.navy,
          image: ImageAssets.logoIcon,
        ),
        OnboardingModel(
          title: 'عنوان ريئسي',
          subTitle:
              'عنوان فرعي كتييييييير تسبي سبيتى سملىبنبثنحي سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين',
          bgColor: ColorManager.lightFuchsia,
          textColor: ColorManager.navy,
          image: ImageAssets.logo1,
        ),
        OnboardingModel(
          title: 'عنوان ريئسي',
          subTitle:
              'عنوان فرعي كتييييييير تسبي سبيتى سملىبنبثنحي سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين',
          bgColor: ColorManager.navy,
          textColor: ColorManager.navy,
          image: ImageAssets.logo2,
        ),
        OnboardingModel(
          title: 'عنوان ريئسي',
          subTitle:
              'عنوان فرعي كتييييييير تسبي سبيتى سملىبنبثنحي سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين سلمبىن سيبىن سىاهنب يمسبىن سيمبىن سمبىين',
          bgColor: ColorManager.paleVioletRed,
          textColor: ColorManager.navy,
          image: ImageAssets.logo,
        ),
      ];

  List<Color> _getPagesColors() =>
      pagesData.map((page) => page.bgColor).toList();

  int _getItemsCount() => pagesData.length;
}
