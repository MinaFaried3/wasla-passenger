import 'package:carousel_slider/carousel_slider.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({super.key});

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  final List<String> ads = [
    AssetsProvider.adsImg,
    AssetsProvider.adsImg,
    AssetsProvider.adsImg,
    AssetsProvider.adsImg,
    AssetsProvider.adsImg,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: ads
          .map((img) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: 130.h,
        animateToClosest: true,
        enlargeFactor: 0.2,
        autoPlayAnimationDuration: DurationManager.s2,
        autoPlayInterval: DurationManager.s4,
        autoPlayCurve: Curves.easeInOut,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        initialPage: 0,
      ),
    );
  }
}
