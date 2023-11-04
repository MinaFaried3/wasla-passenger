import 'package:wasla/presentation/modules/forgot_password/forgot_password_view.dart';
import 'package:wasla/presentation/modules/login/login_view.dart';
import 'package:wasla/presentation/modules/onboarding/view/onboarding_view.dart';
import 'package:wasla/presentation/modules/otp/otp_view.dart';
import 'package:wasla/presentation/modules/register/register_view.dart';
import 'package:wasla/presentation/modules/reset_password/reset_password_view.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

class RoutesStrings {
  static const String onboardingRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot_password';
  static const String resetPasswordRoute = '/reset_password';
  static const String otpRoute = '/otp';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesStrings.onboardingRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => OnboardingCubit(),
                lazy: true,
                child: const OnboardingScreen()));
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
