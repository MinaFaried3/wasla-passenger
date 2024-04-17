import 'package:wasla/app/shared/common/common_libs.dart';

class SectionTitle extends StatefulWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: DurationManager.s6);
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
          AppPadding.fromLR + 8, AppPadding.fromLR, AppPadding.fromLR, 10),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Text(
          widget.title,
          style: getBoldStyle(fontSize: FontSize.sectionTitles),
        ),
      ),
    );
  }
}
