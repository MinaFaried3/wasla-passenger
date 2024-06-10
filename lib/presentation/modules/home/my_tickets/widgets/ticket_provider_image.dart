import 'package:wasla/app/shared/common/common_libs.dart';

class TicketProviderImage extends StatelessWidget {
  const TicketProviderImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 90.w,
        height: 40.w,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorsManager.darkTealBackground4,
            image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
