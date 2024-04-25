import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/start/widgets/welcome_text.dart';

class WelcomeImg extends StatelessWidget {
  final String passengerName;

  const WelcomeImg({super.key, required this.passengerName});

  @override
  Widget build(BuildContext context) {
    final responsive = ContextManager(context, hasAppBar: false);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                AssetsProvider.startImg,
                fit: BoxFit.fill,
                width: double.infinity,
                height: responsive.getScreenHeightPercentage(95),
              ),
              PositionedDirectional(
                top: responsive.getBodyHeightPercentage(15),
                child: WelcomeText(passengerName: passengerName),
              )
            ],
          )
        ],
      ),
    );
  }
}
