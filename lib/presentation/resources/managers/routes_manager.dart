import 'package:wasla/presentation/modules/forgot_password/forgot_password_view.dart';
import 'package:wasla/presentation/modules/login/login_view.dart';
import 'package:wasla/presentation/modules/onboarding/view/onboarding_view.dart';
import 'package:wasla/presentation/modules/otp/otp_view.dart';
import 'package:wasla/presentation/modules/register/register_view.dart';
import 'package:wasla/presentation/modules/reset_password/reset_password_view.dart';
import 'package:wasla/presentation/modules/start_now/start_now_screen.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

class RoutesStrings {
  static const String startNowRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot_password';
  static const String resetPasswordRoute = '/reset_password';
  static const String otpRoute = '/otp';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesStrings.startNowRoute:
        return MaterialPageRoute(builder: (_) => const StartNowScreen());
      case RoutesStrings.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesStrings.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutesStrings.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RoutesStrings.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case RoutesStrings.otpRoute:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case RoutesStrings.onboardingRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => OnboardingCubit()),
                  BlocProvider(
                      create: (context) => OnChangeOnBoardingPageCubit()),
                ], child: const OnboardingScreen()));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRoute),
              ),
            ));
  }
}
