import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController controller = TextEditingController();
  late String iconPath;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    iconPath = AssetsProvider.openEyeIcon;
  }

  double height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              color: ColorsManager.tealPrimary,
              duration: DurationManager.s4,
              height: height,
              curve: Curves.bounceOut,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (height == 200) {
                      height = 400;
                    } else {
                      height = 200;
                    }
                  });
                },
                child: Center(
                  child: LoadingIndicator(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              color: ColorsManager.tealPrimary,
              duration: DurationManager.m750,
              child: Center(
                child: LoadingIndicator(
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the top and bottom cut percentages
    double topCutPercentage = 0.2; // 20%
    double bottomCutPercentage = 0.2; // 20%

    // Calculate the cut heights
    double topCutHeight = size.height * topCutPercentage;
    double bottomCutHeight = size.height * bottomCutPercentage;

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
