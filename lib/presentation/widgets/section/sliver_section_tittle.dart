import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/section/section_title.dart';

class SliverSectionHead extends StatelessWidget {
  const SliverSectionHead({
    super.key,
    required this.tittle,
    this.action,
  });

  final String tittle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.fromSTEB(0, 0, AppPadding.fromLR, 0),
        child: Row(
          children: [
            SectionTitle(title: tittle),
            const Spacer(),
            if (action != null) action!
          ],
        ),
      ),
    );
  }
}
