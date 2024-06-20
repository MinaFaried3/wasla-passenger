import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/followers/follower_item.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.tittle,
    required this.list,
    this.action,
  });

  final String tittle;
  final List<UserTileModel> list;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.sizeOf(context).width -
            (2 * AppPadding.screenPadding) -
            5) /
        2;
    return SizedBox(
      height: list.length > 5 ? list.length * 70 : 500,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
              bottom: 50,
            ),
            decoration: const BoxDecoration(
                color: ColorsManager.offWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Text(
              tittle,
              style: getBoldStyle(
                color: ColorsManager.darkTealBackground3,
                fontSize: 14.sp,
              ),
            ),
          ),
          Positioned(
            top: 35,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width,
                  decoration: BoxDecoration(
                      color: ColorsManager.darkTealBackground3,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return FollowerItem(
                        user: list[index],
                      );
                    },
                    itemCount: list.length,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: action,
              )),
        ],
      ),
    );
  }
}
