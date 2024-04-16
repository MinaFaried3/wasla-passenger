import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/test/navigation_view.dart';
import 'package:wasla/presentation/modules/test/navigation_view_item.dart';
import 'package:wasla/presentation/widgets/app_bottom_nav_bar/app_bottom_nav_bar.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int selectedIndex = 0;
  bool show = false;
  List<IconData> data = [
    Icons.home_outlined,
    Icons.search,
    Icons.add_box_outlined,
    Icons.favorite_outline_sharp,
    Icons.person_outline_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          children: [
            Switch(
                value: show,
                onChanged: (f) => setState(() {
                      show = f;
                    })),
            AppBottomNavBar(
              onChangePage: (idx) {
                setState(() {
                  selectedIndex = idx;
                });
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
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    color: Colors.blue,
                    width: 100,
                    height: 200,
                  );
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: show
          ? AppBottomNavBar(
              onChangePage: (idx) {
                setState(() {
                  selectedIndex = idx;
                });
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
            )
          : null,
    );
  }

  NavigationView buildNavigationView() {
    return NavigationView(
      onChangePage: (c) {},
      curve: Curves.linear,
      durationAnimation: const Duration(milliseconds: 400),
      items: [
        ItemNavigationView(
            childAfter: const Icon(
              Icons.home_rounded,
              color: Colors.blue,
              size: 30,
            ),
            childBefore: Icon(
              Icons.home_outlined,
              color: Colors.grey.withAlpha(60),
              size: 30,
            )),
        ItemNavigationView(
            childAfter: const Icon(
              Icons.widgets_rounded,
              color: Colors.blue,
              size: 30,
            ),
            childBefore: Icon(
              Icons.now_widgets_outlined,
              color: Colors.grey.withAlpha(60),
              size: 30,
            )),
        ItemNavigationView(
            childAfter: const Icon(
              Icons.wifi,
              color: Colors.blue,
              size: 30,
            ),
            childBefore: Icon(
              Icons.wifi_lock,
              color: Colors.grey.withAlpha(60),
              size: 30,
            )),
        ItemNavigationView(
            childAfter: const Icon(
              Icons.accessible,
              color: Colors.blue,
              size: 30,
            ),
            childBefore: Icon(
              Icons.not_accessible,
              color: Colors.grey.withAlpha(60),
              size: 30,
            )),
      ],
    );
  }

  Widget buildCustomBottomNavBar() {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(50),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 35,
                  decoration: BoxDecoration(
                    border: i == selectedIndex
                        ? const Border(
                            top: BorderSide(width: 3.0, color: Colors.white))
                        : null,
                    gradient: i == selectedIndex
                        ? LinearGradient(
                            colors: [Colors.grey.shade800, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        : null,
                  ),
                  child: Icon(
                    data[i],
                    size: 35,
                    color: i == selectedIndex
                        ? Colors.white
                        : Colors.grey.shade800,
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the top and bottom cut percentages
    double topCutPercentage = 0.2; // 20%
    // double bottomCutPercentage = 0.2; // 20%

    // Calculate the cut heights
    double topCutHeight = size.height * topCutPercentage;
    // double bottomCutHeight = size.height * bottomCutPercentage;

    // Draw the widget with cutouts
    Paint paint = Paint()..color = Colors.blue; // Adjust the color as needed
    canvas.drawRect(
      Rect.fromLTRB(0, topCutHeight, size.width * 0.5, size.height - 50),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyClipper extends CustomClipper<Rect> {
  Rect getClipPath(Size size) {
    return Rect.fromLTWH(0, 0, size.width / 2, size.height / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }

  @override
  Rect getClip(Size size) {
    return getClipPath(size);
  }
}
