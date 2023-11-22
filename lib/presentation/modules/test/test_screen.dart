import 'package:wasla/app/shared/common/common_libs.dart';

class TestScreen extends StatefulWidget {
  TestScreen({super.key});

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
      body: Form(
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
                SizedBox(
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
                    padding: EdgeInsets.all(0),
                    icon: SvgPicture.asset(
                      iconPath,
                      width: 35,
                      colorFilter: ColorFilter.mode(
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
                SizedBox(
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
                        colorFilter: ColorFilter.mode(
                          ColorsManager.offWhite300,
                          BlendMode.srcIn,
                        ),
                      )),
                ),
                TextButton(
                    onPressed: () {
                      key.currentState?.validate();
                    },
                    child: Text("validate"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
