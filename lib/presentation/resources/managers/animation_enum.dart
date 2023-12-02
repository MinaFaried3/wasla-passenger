part of 'package:wasla/presentation/common/rive_controller.dart';

///login bear
enum BearState {
  idle(_BearStateStrings.idle),
  lookLeft(_BearStateStrings.lookLeft),
  lookMediumLeft(_BearStateStrings.lookMediumLeft),
  lookRight(_BearStateStrings.lookRight),
  lookMediumRight(_BearStateStrings.lookMediumRight),
  lookCenter(_BearStateStrings.lookCenter),
  lookIdle(_BearStateStrings.lookIdle),
  success(_BearStateStrings.success),
  fail(_BearStateStrings.fail),
  handsUp(_BearStateStrings.handsUp),
  handsDown(_BearStateStrings.handsDown),
  none(_BearStateStrings.none),
  ;

  final String value;

  const BearState(this.value);
}

class _BearStateStrings {
  static const String idle = 'idle';
  static const String lookLeft = 'look_left';
  static const String lookMediumLeft = 'look_medium_left';
  static const String lookRight = 'look_right';
  static const String lookMediumRight = 'look_medium_right';
  static const String lookCenter = 'look_center';
  static const String lookIdle = 'look_idle';
  static const String success = 'success';
  static const String fail = 'fail';
  static const String handsUp = 'hands_up';
  static const String handsDown = 'hands_down';
  static const String none = 'none';
}
