import 'package:rive/rive.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

class RiveControllerManager {
  late final Map<LoginBearStates, RiveAnimationController> _states;

  RiveControllerManager._internal() {
    _initStates();
  }

  Map<LoginBearStates, RiveAnimationController> get states => _states;

  static final RiveControllerManager _instance =
      RiveControllerManager._internal();

  factory RiveControllerManager() => _instance;

  late final Artboard? riveArtBoard;

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void _initStates() {
    _states = {
      LoginBearStates.idle: SimpleAnimation(LoginBearStates.idle.name),
      LoginBearStates.success: SimpleAnimation(LoginBearStates.success.name),
      LoginBearStates.fail: SimpleAnimation(LoginBearStates.fail.name),
      LoginBearStates.hands_up: SimpleAnimation(LoginBearStates.hands_up.name),
      LoginBearStates.look_idle:
          SimpleAnimation(LoginBearStates.look_idle.name),
      LoginBearStates.Look_down_left:
          SimpleAnimation(LoginBearStates.Look_down_left.name),
      LoginBearStates.Look_down_right:
          SimpleAnimation(LoginBearStates.Look_down_right.name),
      LoginBearStates.hands_down:
          SimpleAnimation(LoginBearStates.hands_down.name),
    };
  }

  void _addCurrentState(LoginBearStates loginBearStates) {
    riveArtBoard?.artboard.addController(_states[loginBearStates]!);
  }

  void _removeCurrentState(LoginBearStates loginBearStates) {
    riveArtBoard?.artboard.removeController(_states[loginBearStates]!);
  }

  void _removeAllStates() {
    for (var state in _states.entries) {
      _removeCurrentState(state.key);
    }

    isLookingLeft = false;
    isLookingRight = false;
  }

  void addState(
    LoginBearStates loginBearStates, {
    bool lookingLeft = false,
    bool lookingRight = false,
    bool successOrFail = false,
  }) {
    _removeAllStates();
    isLookingRight = lookingRight;
    isLookingLeft = lookingLeft;

    _addCurrentState(loginBearStates);

    if (!successOrFail) _addCurrentState(LoginBearStates.idle);
  }
}
