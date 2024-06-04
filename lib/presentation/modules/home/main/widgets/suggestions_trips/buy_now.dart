import 'package:wasla/app/shared/common/common_libs.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: AppButton(
              text: AppStrings.bookNow.tr(),
              fontSize: 13,
              height: 40,
              onPressed: () {},
            )),
        Flexible(
          child: IconButton(
              onPressed: () {},
              icon: const AppSvg(
                path: AssetsProvider.heartIcon,
                color: ColorsManager.tealPrimary600,
              )),
        )
      ],
    );
  }
}
