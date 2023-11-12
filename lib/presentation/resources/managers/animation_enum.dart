///login bear
enum LoginBearState {
  idle(_LoginBearStateStrings.idle),
  lookLeft(_LoginBearStateStrings.lookLeft),
  lookMediumLeft(_LoginBearStateStrings.lookMediumLeft),
  lookRight(_LoginBearStateStrings.lookRight),
  lookMediumRight(_LoginBearStateStrings.lookMediumRight),
  lookCenter(_LoginBearStateStrings.lookCenter),
  lookIdle(_LoginBearStateStrings.lookIdle),
  success(_LoginBearStateStrings.success),
  fail(_LoginBearStateStrings.fail),
  handsUp(_LoginBearStateStrings.handsUp),
  handsDown(_LoginBearStateStrings.handsDown),
  none(_LoginBearStateStrings.none),
  ;

  final String value;

  const LoginBearState(this.value);
}

class _LoginBearStateStrings {
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
