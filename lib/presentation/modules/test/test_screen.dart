import 'package:wasla/app/shared/common/common_libs.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingIndicator(
          height: 200,
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: key,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppTextFormField(
                textDirection: TextDirection.ltr,
                labelText: 'user name',
                svgPrefixPath: AssetsProvider.userIcon2,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                textDirection: TextDirection.ltr,
                labelText: 'password',
                svgPrefixPath: AssetsProvider.passwordIcon2,
                isPassword: clicked,
                validator: (str) =>
                    str == null || str.isEmpty ? 'wrong val' : null,
                suffix: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: SvgPicture.asset(
                    iconPath,
                    width: 35,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.brownGey,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {
                    clicked = !clicked;
                    setState(() {
                      clicked
                          ? iconPath = AssetsProvider.closedEyeIcon
                          : iconPath = AssetsProvider.openEyeIcon;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'dssddsdfds sfdf',
                    labelText: 'mooo',
                    alignLabelWithHint: true,
                    prefixIcon: SvgPicture.asset(
                      iconPath,
                      width: 35,
                      colorFilter: const ColorFilter.mode(
                        ColorsManager.offWhite300,
                        BlendMode.srcIn,
                      ),
                    )),
              ),
              TextButton(
                  onPressed: () {
                    key.currentState?.validate();
                  },
                  child: const Text("validate"))
            ],
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
