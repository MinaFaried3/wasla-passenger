import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/section/section_title.dart';

class SectionWithTitle extends StatelessWidget {
  const SectionWithTitle({
    super.key,
    required this.tittle,
    required this.content,
    this.enableContentPadding = true,
  });

  final String tittle;
  final Widget content;
  final bool enableContentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        SectionTitle(title: tittle),

        //container
        enableContentPadding
            ? Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.fromLR,
                  right: AppPadding.fromLR,
                  bottom: AppPadding.fromLR,
                ),
                child: content,
              )
            : content,
      ],
    );
  }
}
