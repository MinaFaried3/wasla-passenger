import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/list_tile.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //logo
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AssetsProvider.horusLogoImg,
              fit: BoxFit.cover,
            ),
          ),
        ),

        //name and rating and price
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
              child: buildCompanyData(),
            ))
      ],
    );
  }

  Column buildCompanyData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppListTile(
          tittle: 'حورس للنقل الجماعي',
          iconSize: 18.sp,
          fontSize: 6.sp,
          iconPath: AssetsProvider.busIcon,
        ),
        AppListTile(
          tittle: '4.5',
          iconSize: 15.sp,
          fontSize: 10.sp,
          iconPath: AssetsProvider.starIcon,
        ),
      ],
    );
  }
}
