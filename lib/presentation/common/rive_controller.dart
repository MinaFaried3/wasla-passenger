import 'package:rive/rive.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

part 'package:wasla/presentation/common/enums/animation_enum.dart';

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

  void _addCurrentState(BearState bearState) {
    if (currentState == bearState && currentState != BearState.idle) return;
    riveArtBoard?.artboard.addController(_states[bearState]!);
  }

  void _removeCurrentState(BearState bearState) {
    riveArtBoard?.artboard.removeController(_states[bearState]!);
  }

  void _removeAllStates() {
    for (var state in _states.entries) {
      if (state.key != BearState.idle) _removeCurrentState(state.key);
    }
  }

  void addState(BearState bearState) {
    _removeAllStates();
    _addCurrentState(bearState);
    currentState = bearState;
  }

  void addStates(List<BearState> bearStates) {
    _removeAllStates();

    for (var bearState in bearStates) {
      _addCurrentState(bearState);
      currentState = bearState;
    }
  }

  void _addLookingState({
    required String value,
    int start = AppConstants.zero,
    int end = AppConstants.thousands,
    BearState wantedBearState = BearState.lookIdle,
  }) {
    if (currentState == wantedBearState) return;

    if (value.isEmpty && currentState != BearState.lookIdle) {
      addState(BearState.lookIdle);
      PrintManager.print(BearState.lookIdle.name);
      return;
    }

    int length = value.length;
    if (length >= start && length < end) {
      addState(wantedBearState);
      PrintManager.print(wantedBearState.name);
    }
  }

  void followFieldText({required String value, int? charsMountOfChangedState}) {
    int x1 = charsMountOfChangedState ?? 2;
    int x2 = (x1 * 2) + 1;
    int x3 = (x1 * 3) + 2;
    int x4 = (x1 * 4) + 3;

    _addLookingState(
      value: value,
      end: x1,
      wantedBearState: BearState.lookLeft,
    );

    _addLookingState(
      value: value,
      start: x1,
      end: x2,
      wantedBearState: BearState.lookMediumLeft,
    );

    _addLookingState(
      value: value,
      start: x2,
      end: x3,
      wantedBearState: BearState.lookCenter,
    );

    _addLookingState(
      value: value,
      start: x3,
      end: x4,
      wantedBearState: BearState.lookMediumRight,
    );

    _addLookingState(
      value: value,
      start: x4,
      wantedBearState: BearState.lookRight,
    );
  }

  void followRightSideFieldText(
      {required String value, int? charsMountOfChangedState}) {
    int x1 = charsMountOfChangedState ?? 1;
    int x2 = (x1 * 2) + 1;
    int x3 = (x1 * 3) + 2;

    _addLookingState(
      value: value,
      end: x1,
      wantedBearState: BearState.lookCenter,
    );

    _addLookingState(
      value: value,
      start: x1,
      end: x2,
      wantedBearState: BearState.lookMediumRight,
    );

    _addLookingState(
      value: value,
      start: x2,
      end: x3,
      wantedBearState: BearState.lookRight,
    );
  }
}
