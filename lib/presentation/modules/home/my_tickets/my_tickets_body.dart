import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/my_tickets/widgets/ticket_item.dart';

class MyTicketsBody extends StatelessWidget {
  const MyTicketsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.fromLR,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList.separated(
              itemBuilder: (context, index) => const TicketItem(),
              separatorBuilder: (context, index) => const VerticalSpace(10),
              itemCount: 20),
          SliverToBoxAdapter(
            child: VerticalSpace(100.h),
          )
        ],
      ),
    );
  }
}
