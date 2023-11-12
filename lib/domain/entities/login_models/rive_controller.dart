import 'package:rive/rive.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

class RiveControllerManager {
  late final Map<LoginBearState, RiveAnimationController> _states;
  late final Artboard? riveArtBoard;
  late LoginBearState currentState;

  Map<LoginBearState, RiveAnimationController> get states => _states;

  static final RiveControllerManager _instance =
      RiveControllerManager._internal();

  RiveControllerManager._internal() {
    currentState = LoginBearState.idle;
    _initStates();
  }

  factory RiveControllerManager() => _instance;

  void _initStates() {
    _states = {
      LoginBearState.idle: SimpleAnimation(LoginBearState.idle.value),
      LoginBearState.success: SimpleAnimation(LoginBearState.success.value),
      LoginBearState.fail: SimpleAnimation(LoginBearState.fail.value),
      LoginBearState.handsUp: SimpleAnimation(LoginBearState.handsUp.value),
      LoginBearState.lookIdle: SimpleAnimation(LoginBearState.lookIdle.value),
      LoginBearState.lookLeft: SimpleAnimation(LoginBearState.lookLeft.value),
      LoginBearState.lookMediumLeft:
          SimpleAnimation(LoginBearState.lookMediumLeft.value),
      LoginBearState.lookCenter:
          SimpleAnimation(LoginBearState.lookCenter.value),
      LoginBearState.lookMediumRight:
          SimpleAnimation(LoginBearState.lookMediumRight.value),
      LoginBearState.lookRight: SimpleAnimation(LoginBearState.lookRight.value),
      LoginBearState.handsDown: SimpleAnimation(LoginBearState.handsDown.value),
    };
  }

  void _addCurrentState(LoginBearState loginBearState) {
    riveArtBoard?.artboard.addController(_states[loginBearState]!);
  }

  void _removeCurrentState(LoginBearState loginBearState) {
    riveArtBoard?.artboard.removeController(_states[loginBearState]!);
  }

  void _removeAllStates() {
    for (var state in _states.entries) {
      if (state.key != LoginBearState.idle) _removeCurrentState(state.key);
    }
  }

  void addState(LoginBearState loginBearState) {
    _removeAllStates();
    _addCurrentState(loginBearState);
    currentState = loginBearState;
  }
}
