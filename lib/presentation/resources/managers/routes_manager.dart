import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/forgot_password/forgot_password_view.dart';
import 'package:wasla/presentation/modules/login/login_view.dart';
import 'package:wasla/presentation/modules/onboarding/view/onboarding_view.dart';
import 'package:wasla/presentation/modules/otp/otp_view.dart';
import 'package:wasla/presentation/modules/register/register_view.dart';
import 'package:wasla/presentation/modules/reset_password/reset_password_view.dart';
import 'package:wasla/presentation/modules/start_now/start_now_screen.dart';
import 'package:wasla/presentation/modules/test/test_screen.dart';

class RoutesStrings {
  static const String startNowRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot_password';
  static const String resetPasswordRoute = '/reset_password';
  static const String otpRoute = '/otp';
  static const String testRoute = '/test';
  static const String unDefinedRoute = '/un_defined';
}

enum Routes {
  startNowRoute(RoutesStrings.startNowRoute),
  onboardingRoute(RoutesStrings.onboardingRoute),
  loginRoute(RoutesStrings.loginRoute),
  registerRoute(RoutesStrings.registerRoute),
  forgotPasswordRoute(RoutesStrings.forgotPasswordRoute),
  resetPasswordRoute(RoutesStrings.resetPasswordRoute),
  otpRoute(RoutesStrings.otpRoute),
  testRoute(RoutesStrings.testRoute),
  unDefined(RoutesStrings.unDefinedRoute);

  final String routeString;

  const Routes(this.routeString);
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    Routes currentRoute = Routes.values.firstWhere(
      (element) => element.routeString == settings.name,
      orElse: () => Routes.unDefined,
    );

    switch (currentRoute) {
      case Routes.startNowRoute:
        return MaterialPageRoute(builder: (_) => const StartNowScreen());
      case Routes.loginRoute:
        DIModulesManger.prepareLoginModule();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: BlocProvidersManager.loginProviders,
                  child: const LoginScreen(),
                ));
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OTPScreen());
      case Routes.onboardingRoute:
        DIModulesManger.prepareOnboardingModule();
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                providers: BlocProvidersManager.onboardingProviders,
                child: const OnboardingScreen()));
      case Routes.testRoute:
        return MaterialPageRoute(builder: (_) => const TestScreen());
      case Routes.unDefined:
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
