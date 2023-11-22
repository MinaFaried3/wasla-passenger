import 'package:rive/rive.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

class RiveControllerManager {
  late final Map<BearState, RiveAnimationController> _states;
  Artboard? riveArtBoard;
  late BearState currentState;

  Map<BearState, RiveAnimationController> get states => _states;

  RiveControllerManager() {
    currentState = BearState.idle;
    _initStates();
  }

  void _initStates() {
    _states = {
      BearState.idle: SimpleAnimation(BearState.idle.value),
      BearState.success: SimpleAnimation(BearState.success.value),
      BearState.fail: SimpleAnimation(BearState.fail.value),
      BearState.handsUp: SimpleAnimation(BearState.handsUp.value),
      BearState.lookIdle: SimpleAnimation(BearState.lookIdle.value),
      BearState.lookLeft: SimpleAnimation(BearState.lookLeft.value),
      BearState.lookMediumLeft: SimpleAnimation(BearState.lookMediumLeft.value),
      BearState.lookCenter: SimpleAnimation(BearState.lookCenter.value),
      BearState.lookMediumRight:
          SimpleAnimation(BearState.lookMediumRight.value),
      BearState.lookRight: SimpleAnimation(BearState.lookRight.value),
      BearState.handsDown: SimpleAnimation(BearState.handsDown.value),
    };
  }

  void _addCurrentState(BearState loginBearState) {
    riveArtBoard?.artboard.addController(_states[loginBearState]!);
  }

  void _removeCurrentState(BearState loginBearState) {
    riveArtBoard?.artboard.removeController(_states[loginBearState]!);
  }

  void _removeAllStates() {
    for (var state in _states.entries) {
      if (state.key != BearState.idle) _removeCurrentState(state.key);
    }
  }

  void addState(BearState loginBearState) {
    _removeAllStates();
    //todo in case of idle and lookidle
    _addCurrentState(loginBearState);
    currentState = loginBearState;
  }
}
