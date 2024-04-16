import 'package:wasla/app/shared/common/common_libs.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 20),
      child: Text(
        title,
        style: getBoldStyle(fontSize: FontSize.sectionTitles),
      ),
    );
  }
}
