import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/home/cubit/home_cubit.dart';
import 'package:wasla/presentation/modules/home/home/model/home_content_item.dart';
import 'package:wasla/presentation/widgets/app_bottom_nav_bar/app_bottom_nav_bar.dart';
import 'package:wasla/presentation/widgets/app_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController fadeController;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    fadeController =
        AnimationController(vsync: this, duration: DurationManager.s2);
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: fadeController, curve: Curves.ease),
    );

    fadeController.forward();
  }

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildBlocBuilder(execute: getTitle),
        leading: const MenuIcon(),
        actions: getAppBarActions(),
      ),
      body: buildBlocBuilder(execute: getBody),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildAppBottomNavBar(context),
    );
  }

  List<Widget> getAppBarActions() {
    return [
      InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        child: const AppSvg(
          path: AssetsProvider.walletIcon,
          height: 30,
        ),
      ),
      const HorizontalSpace(8),
      InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        child: const AppSvg(
          path: AssetsProvider.notificationIcon,
          height: 30,
        ),
      ),
      const HorizontalSpace(AppPadding.fromLR),
    ];
  }

  AppBottomNavBar buildAppBottomNavBar(BuildContext context) {
    return AppBottomNavBar(
      onChangePage: (index) {
        context.read<HomeCubit>().changeBodyContent(index);
        replayTitleAnimation();
      },
      items: const [
        BottomNavBarItem(
          iconPath: AssetsProvider.homeIcon,
        ),
        BottomNavBarItem(
          iconPath: AssetsProvider.locationIcon,
        ),
        BottomNavBarItem(
          iconPath: AssetsProvider.searchIcon,
        ),
        BottomNavBarItem(
          iconPath: AssetsProvider.ticketsIcon,
        ),
        BottomNavBarItem(
          iconPath: AssetsProvider.userIcon,
        ),
      ],
    );
  }

  void replayTitleAnimation() {
    fadeController.reset();
    fadeController.forward();
  }

  BlocBuilder<HomeCubit, HomeState> buildBlocBuilder(
      {required Widget Function(HomeContentItem) execute}) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(initial: execute, changeBodyContent: execute);
      },
    );
  }

  Widget getTitle(HomeContentItem homeContentItem) => FadeTransition(
        opacity: fadeAnimation,
        child: Text(
          homeContentItem.title.tr(),
        ),
      );

  Widget getBody(HomeContentItem homeContentItem) => homeContentItem.body;
}
