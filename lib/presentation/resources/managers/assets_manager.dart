// base dirs
const String _assets = 'assets';
const String _images = '/images';
const String _animation = '/animation';

//base paths
const String _imagePath = _assets + _images;
const String _animationPath = _assets + _animation;

class AssetsProvider {
  ///dirs
  //images_dirs
  static const String _logo = '$_imagePath/logo';
  static const String _onboarding = '$_imagePath/onboarding';
  static const String _accountVerification = '$_imagePath/account_verification';
  static const String _svg = '$_imagePath/svg';
  static const String _background = '$_imagePath/background';
  static const String _png = '$_imagePath/png';

  //animation_dirs
  static const String _rive = '$_animationPath/rive';
  static const String _json = '$_animationPath/json';

  ///animation
  //rive
  static const String bear = '$_rive/bear.riv';

  //json animation
  static const String loadingIndicator = '$_json/loading_indicator.json';
  static const String otp = '$_json/otp.json';

  ///images
  //logo
  static const String logo = '$_logo/logo.png';
  static const String logo500 = '$_logo/logo_500.png';
  static const String logo1000 = '$_logo/logo_1000.png';
  static const String logoIcon = '$_logo/logo_icon.png';
  static const String logoTypo = '$_logo/logo_typo.png';

  //start now
  static const String startNowBackground =
      '$_background/background_start_now.png';
  static const String startImg = '$_png/start.png';

  //onboarding
  static const String onboarding1 = '$_onboarding/welcome_onboarding.png';
  static const String onboarding2 = '$_onboarding/ticket_onboarding.png';
  static const String onboarding3 = '$_onboarding/delivery_onboarding.png';
  static const String onboarding4 = '$_onboarding/ads_onboarding.png';
  static const String onboarding5 = '$_onboarding/following_onboarding.png';
  static const String onboarding6 = '$_onboarding/private_bus_onboarding.png';
  static const String onboarding7 = '$_onboarding/seat_onboarding.png';

  //verification account(otp)
  static const String editEmail = '$_accountVerification/edit_email.svg';
  static const String editPhone = '$_accountVerification/edit_phone.svg';
  static const String enterVerificationCode =
      '$_accountVerification/enter_verification_code.svg';

  ///icons
  //svg icons
  static const String arrowDown1Icon = '$_svg/arrow_down1.svg';
  static const String arrowDown2Icon = '$_svg/arrow_down2.svg';
  static const String arrowDown3Icon = '$_svg/right_arrow_ic.svg';
  static const String homeIcon = '$_svg/home.svg';
  static const String wifiIcon = '$_svg/wifi.svg';
  static const String searchIcon = '$_svg/search.svg';
  static const String userIcon = '$_svg/user_icon.svg';
  static const String openEyeIcon = '$_svg/open_eye_icon.svg';
  static const String closedEyeIcon = '$_svg/closed_eye_icon.svg';
  static const String passwordIcon = '$_svg/password_icon.svg';
  static const String passwordIcon2 = '$_svg/password1_icon.svg';
  static const String emailIcon = '$_svg/email_icon.svg';
  static const String phoneIcon = '$_svg/phone_icon.svg';
  static const String cameraIcon = '$_svg/camera_icon.svg';
  static const String busIcon = '$_svg/bus_icon.svg';
  static const String proIcon = '$_svg/pro_icon.svg';
  static const String appleIcon = '$_svg/apple_icon.svg';
  static const String facebookIcon = '$_svg/facebook_icon.svg';
  static const String googleIcon = '$_svg/google_icon.svg';
  static const String doneIcon = '$_svg/done_icon.svg';
  static const String errorIcon = '$_svg/error_icon.svg';
  static const String arrowLeftIcon = '$_svg/arrow_left_icon.svg';
  static const String arrowRightIcon = '$_svg/arrow_right_icon.svg';
  static const String arrowBackIcon = '$_svg/arrow_back_icon.svg';
  static const String exitIcon = '$_svg/exit_icon.svg';
}
