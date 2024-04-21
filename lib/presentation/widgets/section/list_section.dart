import 'package:wasla/app/shared/common/common_libs.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.tittle,
    required this.item,
    this.action,
    required this.viewAllPressed,
    this.viewedItemLength = 5,
  });

  final String tittle;
  final Widget item;
  final int? viewedItemLength;
  final Widget? action;
  final VoidCallback viewAllPressed;

  @override
  Widget build(BuildContext context) {
    double width =
        (MediaQuery.sizeOf(context).width - (2 * AppPadding.fromLR) - 5) / 2;
    return SizedBox(
      height: 500.h,
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
                      return item;
                    },
                    itemCount: viewedItemLength,
                    shrinkWrap: true,
                  ),
                ),
                AppButton.dark(
                    text: AppStrings.viewAll.tr(),
                    width: width,
                    fontSize: 15.sp,
                    height: 25,
                    radius: 15,
                    onPressed: viewAllPressed),
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
