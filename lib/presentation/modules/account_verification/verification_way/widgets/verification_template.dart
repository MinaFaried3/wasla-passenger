import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/scale_img.dart';
import 'package:wasla/presentation/modules/account_verification/widgets/titles.dart';
import 'package:wasla/presentation/widgets/app_bar_back_button.dart';

class VerificationTemplate extends StatefulWidget {
  final String contact;
  final String title;
  final String subTitle;
  final String imgPath;
  final Widget child;

  const VerificationTemplate({
    super.key,
    required this.contact,
    required this.title,
    required this.subTitle,
    required this.imgPath,
    required this.child,
  });

  @override
  State<VerificationTemplate> createState() => _VerificationTemplateState();
}

class _VerificationTemplateState extends State<VerificationTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //back button
                const AppBarBackButton(),

                //titles
                Titles(title: widget.title, subTitle: widget.subTitle),

                //image
                ScaleImage(path: widget.imgPath),

                //child
                widget.child
              ],
            ),
          ),
        ),
      ),
    );
  }
}
