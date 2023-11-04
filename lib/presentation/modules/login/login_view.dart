import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtBoard;
  late final RiveAnimationController idleController;
  late final RiveAnimationController lookIdleController;
  late final RiveAnimationController lookDownLeftController;
  late final RiveAnimationController lookDownRightController;
  late final RiveAnimationController successController;
  late final RiveAnimationController failController;
  late final RiveAnimationController handsUpController;
  late final RiveAnimationController handsDownController;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "mina@gmail.com";
  String password = "1234567";

  final FocusNode passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  @override
  void initState() {
    super.initState();
    idleController = SimpleAnimation(LoginBearStatus.idle.name);
    lookIdleController = SimpleAnimation(LoginBearStatus.look_idle.name);
    lookDownLeftController =
        SimpleAnimation(LoginBearStatus.Look_down_left.name);
    lookDownRightController =
        SimpleAnimation(LoginBearStatus.Look_down_right.name);
    successController = SimpleAnimation(LoginBearStatus.success.name);
    failController = SimpleAnimation(LoginBearStatus.fail.name);
    handsUpController = SimpleAnimation(LoginBearStatus.hands_up.name);
    handsDownController = SimpleAnimation(LoginBearStatus.hands_down.name);

    go();
    checkPasswordFocused();
  }

  go() async {
    await rootBundle.load('assets/animation/rive/login_bear.riv').then((data) {
      final file = RiveFile.import(data);

      final artBoard = file.mainArtboard;
      artBoard.addController(idleController);
      setState(() {
        riveArtBoard = artBoard;
      });
    }).catchError((error) {
      print("ERROR  ______________ ${error.toString()}");
    });
  }

  void removeAllController() {
    //loop list remove
    riveArtBoard?.artboard.removeController(idleController);
    riveArtBoard?.artboard.removeController(lookIdleController);
    riveArtBoard?.artboard.removeController(lookDownLeftController);
    riveArtBoard?.artboard.removeController(lookDownRightController);
    riveArtBoard?.artboard.removeController(failController);
    riveArtBoard?.artboard.removeController(successController);
    riveArtBoard?.artboard.removeController(handsUpController);
    riveArtBoard?.artboard.removeController(handsDownController);

    isLookingLeft = false;
    isLookingRight = false;
  }

  void addController(
    RiveAnimationController controller, {
    bool lookingLeft = false,
    bool lookingRight = false,
    bool successOrFail = false,
  }) {
    removeAllController();
    isLookingRight = lookingRight;
    isLookingLeft = lookingLeft;
    riveArtBoard?.artboard.addController(controller);
    if (!successOrFail) riveArtBoard?.artboard.addController(idleController);

    print(controller.toString());
  }

  void checkPasswordFocused() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus)
        addController(handsUpController);
      else if (!passwordFocusNode.hasFocus) addController(handsDownController);
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.getWidthPercentage(3)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (riveArtBoard != null)
                    CircleAvatar(
                        radius: responsive.screenWidth * 0.3,
                        child: Rive(
                          artboard: riveArtBoard!,
                          fit: BoxFit.contain,
                          enablePointerEvents: true,
                          useArtboardSize: true,
                        ))
                  else
                    SizedBox.shrink(),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            validator: (value) =>
                                value != email ? "Wrong email" : null,
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  value.length > 16 &&
                                  !isLookingRight) {
                                addController(lookDownRightController,
                                    lookingRight: true);
                              } else if (value.isNotEmpty &&
                                  value.length < 16 &&
                                  !isLookingLeft) {
                                addController(lookDownLeftController,
                                    lookingLeft: true);
                              } else if (value.isEmpty) {
                                addController(lookIdleController);
                              }
                            },
                          ),
                          SizedBox(
                            height: responsive.getScreenHeightPercentage(3),
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            focusNode: passwordFocusNode,
                          ),
                          TextButton(
                              onPressed: () {
                                passwordFocusNode.unfocus();
                                Future.delayed(const Duration(seconds: 1), () {
                                  if (passwordController.text == password &&
                                      emailController.text == email)
                                    addController(successController,
                                        successOrFail: true);
                                  else
                                    addController(failController,
                                        successOrFail: true);
                                });
                              },
                              child: Text("LOGIN"))
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
