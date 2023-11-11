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
  bool isLookingCenter = false;
  bool isLookingMediumLeft = false;
  bool isLookingMediumRight = false;

  void _initStates() {
    _states = {
      LoginBearStates.idle: SimpleAnimation(LoginBearStates.idle.name),
      LoginBearStates.success: SimpleAnimation(LoginBearStates.success.name),
      LoginBearStates.fail: SimpleAnimation(LoginBearStates.fail.name),
      LoginBearStates.hands_up: SimpleAnimation(LoginBearStates.hands_up.name),
      LoginBearStates.look_idle:
          SimpleAnimation(LoginBearStates.look_idle.name),
      LoginBearStates.look_left:
          SimpleAnimation(LoginBearStates.look_left.name),
      LoginBearStates.look_medium_left:
          SimpleAnimation(LoginBearStates.look_medium_left.name),
      LoginBearStates.look_center:
          SimpleAnimation(LoginBearStates.look_center.name),
      LoginBearStates.look_medium_right:
          SimpleAnimation(LoginBearStates.look_medium_right.name),
      LoginBearStates.Look_right:
          SimpleAnimation(LoginBearStates.Look_right.name),
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
    //TODO SRP
    isLookingLeft = false;
    isLookingRight = false;
    isLookingCenter = false;
    isLookingMediumLeft = false;
    isLookingMediumRight = false;
  }

  //TODO SRP
  void addState(
    LoginBearStates loginBearStates, {
    bool lookingLeft = false,
    bool lookingRight = false,
    bool lookingCenter = false,
    bool lookingMediumLeft = false,
    bool lookingMediumRight = false,
    bool successOrFail = false,
  }) {
    _removeAllStates();

    isLookingRight = lookingRight;
    isLookingLeft = lookingLeft;
    isLookingCenter = lookingCenter;
    isLookingMediumLeft = lookingMediumLeft;
    isLookingMediumRight = lookingMediumRight;

    _addCurrentState(loginBearStates);

    if (!successOrFail) _addCurrentState(LoginBearStates.idle);
  }
}
