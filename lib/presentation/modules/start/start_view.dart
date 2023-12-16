import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/start/widgets/custom_slider_button.dart';
import 'package:wasla/presentation/modules/start/widgets/welcome_img.dart';

class StartScreen extends StatelessWidget {
  final String passengerName;

  const StartScreen({super.key, required this.passengerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo overlay
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //image
          WelcomeImg(
            passengerName: passengerName,
          ),

          Padding(
            padding: EdgeInsets.all(AppPadding.p28.sp),
            child: CustomSliderButton(
              height: AppSize.s80.h,
              width: AppSize.s300.w,
            ),
          )

          //slider
        ],
      ),
    );
  }
}
