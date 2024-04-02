import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/edit_email/view/edit_email_view.dart';
import 'package:wasla/presentation/modules/account_verification/edit_phone/view/edit_phone_view.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/view/verify_email_view.dart';
import 'package:wasla/presentation/modules/account_verification/phone_verify/view/verify_phone_view.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/view/verification_way_view.dart';
import 'package:wasla/presentation/modules/forgot_password/forgot_password_view.dart';
import 'package:wasla/presentation/modules/login/view/login_view.dart';
import 'package:wasla/presentation/modules/onboarding/view/onboarding_view.dart';
import 'package:wasla/presentation/modules/register/view/register_view.dart';
import 'package:wasla/presentation/modules/reset_password/reset_password_view.dart';
import 'package:wasla/presentation/modules/start/start_view.dart';
import 'package:wasla/presentation/modules/start_now/start_now_screen.dart';
import 'package:wasla/presentation/modules/test/test_screen.dart';

class RoutesStrings {
  static const String startNowRoute = '/start_now';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot_password';
  static const String resetPasswordRoute = '/reset_password';
  static const String verificationWayRoute = '/verification_way';
  static const String editPhoneRoute = '/edit_phone';
  static const String editEmailRoute = '/edit_email';
  static const String verifyPhoneRoute = '/verify_phone';
  static const String verifyEmailRoute = '/verify_email';
  static const String startRoute = '/start';
  static const String unDefinedRoute = '/un_defined';
  static const String testRoute = '/test';
}

enum Routes {
  startNowRoute(RoutesStrings.startNowRoute),
  onboardingRoute(RoutesStrings.onboardingRoute),
  loginRoute(RoutesStrings.loginRoute),
  registerRoute(RoutesStrings.registerRoute),
  forgotPasswordRoute(RoutesStrings.forgotPasswordRoute),
  resetPasswordRoute(RoutesStrings.resetPasswordRoute),
  verificationWayRoute(RoutesStrings.verificationWayRoute),
  editPhoneRoute(RoutesStrings.editPhoneRoute),
  editEmailRoute(RoutesStrings.editEmailRoute),
  verifyPhoneRoute(RoutesStrings.verifyPhoneRoute),
  verifyEmailRoute(RoutesStrings.verifyEmailRoute),
  start(RoutesStrings.startRoute),
  testRoute(RoutesStrings.testRoute),
  unDefined(RoutesStrings.unDefinedRoute);

  final String path;

  const Routes(this.path);
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    Routes currentRoute = Routes.values.firstWhere(
      (element) => element.path == settings.name,
      orElse: () => Routes.unDefined,
    );

    final args = settings.arguments;

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
        DIModulesManger.prepareRegisterModule();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: BlocProvidersManager.registerProviders,
                  child: const RegisterScreen(),
                ));
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.verificationWayRoute:
        return MaterialPageRoute(
            builder: (_) => const VerificationWayScreen(
                  //todo
                  //get connections from local
                  connections:
                      Connections(email: 'mina@se.com', phone: '01207340018'),
                ));
      case Routes.editPhoneRoute:
        //todo
        //get connections from local
        return MaterialPageRoute(
            builder: (_) => EditPhoneScreen(
                  phone: '01207340018',
                  title: (args as String?) ?? AppStrings.editYourOwnPhone,
                ));
      case Routes.editEmailRoute:
        //todo
        //get connections from local
        return MaterialPageRoute(
            builder: (_) => EditEmailScreen(
                  email: 'ewew@ewew.com',
                  title: (args as String?) ?? AppStrings.editYourOwnEmail,
                ));
      case Routes.verifyPhoneRoute:
        return MaterialPageRoute(
            builder: (_) => const VerifyPhoneScreen(phone: '01207340018'));
      case Routes.verifyEmailRoute:
        return MaterialPageRoute(
            builder: (_) => const VerifyEmailScreen(email: 'mina@se.com'));
      case Routes.onboardingRoute:
        DIModulesManger.prepareOnboardingModule();
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                providers: BlocProvidersManager.onboardingProviders,
                child: const OnboardingScreen()));
      case Routes.start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
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
