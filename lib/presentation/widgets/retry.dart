import 'package:wasla/app/shared/common/common_libs.dart';

import 'responsive/FlexibleFitted.dart';

class Retry extends StatelessWidget {
  const Retry({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: onPressed,
              icon: const AppSvg(
                color: ColorsManager.offWhite,
                height: 30,
                path: AssetsProvider.retryIcon,
              )),
          FittedFlexible(
            child: Text(
              text,
              style: getMediumStyle(),
            ),
          )
        ],
      ),
    );
  }
}