import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/view/edit_email_view.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/view/edit_phone_view.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/cubit/email_verify_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/view/verify_email_view.dart';
import 'package:wasla/presentation/modules/account_verification/phone_verify/view/verify_phone_view.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/view/verification_way_view.dart';
import 'package:wasla/presentation/modules/edit_profile/edit_profile_view.dart';
import 'package:wasla/presentation/modules/forgot_password/forgot_password_view.dart';
import 'package:wasla/presentation/modules/home/home/view/home_screen.dart';
import 'package:wasla/presentation/modules/login/view/login_view.dart';
import 'package:wasla/presentation/modules/notification/notification_screen.dart';
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
  static const String home = '/';
  static const String editProfile = '/edit_profile';
  static const String notification = '/notification';
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
  home(RoutesStrings.home),
  editProfile(RoutesStrings.editProfile),
  notification(RoutesStrings.notification),
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
            builder: (_) =>
                MultiBlocProvider(
                  providers: BlocProvidersManager.loginProviders,
                  child: const LoginScreen(),
                ));
      case Routes.registerRoute:
        DIModulesManger.prepareRegisterModule();

        return MaterialPageRoute(
            builder: (_) =>
                MultiBlocProvider(
                  providers: BlocProvidersManager.registerProviders,
                  child: const RegisterScreen(),
                ));
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.verificationWayRoute:
        DIModulesManger.prepareVerificationModule();

        return MaterialPageRoute(
            builder: (_) =>
                MultiBlocProvider(
                    providers: BlocProvidersManager.verificationProviders,
                    child: const VerificationWayScreen()));
      case Routes.editPhoneRoute:
        return MaterialPageRoute(
            builder: (_) =>
                MultiBlocProvider(
                    providers: BlocProvidersManager.verificationProviders,
                    child: const EditPhoneScreen()));
      case Routes.editEmailRoute:
        return MaterialPageRoute(
            builder: (_) =>
                MultiBlocProvider(
                    providers: BlocProvidersManager.verificationProviders,
                    child: const EditEmailScreen()));
      case Routes.verifyPhoneRoute:
        return MaterialPageRoute(builder: (_) => const VerifyPhoneScreen());
      case Routes.verifyEmailRoute:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) =>
                  getIt<EmailVerifyCubit>()
                    ..sendVerificationEmail(),
                  child: const VerifyEmailScreen(),
                ));
      case Routes.onboardingRoute:
        DIModulesManger.prepareOnboardingModule();

        return MaterialPageRoute(
            builder: (context) =>
                MultiBlocProvider(
                    providers: BlocProvidersManager.onboardingProviders,
                    child: const OnboardingScreen()));
      case Routes.start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Routes.home:
        DIModulesManger.prepareHomeModule();

        return MaterialPageRoute(
          builder: (_) =>
              MultiBlocProvider(
                providers: BlocProvidersManager.homeProviders,
                child: const HomeScreen(),
              ),
        );
      case Routes.testRoute:
        return MaterialPageRoute(builder: (_) => const TestScreen());
      case Routes.unDefined:
        return unDefinedRoute();

      case Routes.editProfile:
        DIModulesManger.prepareEditProfileModule();
        return MaterialPageRoute(
          builder: (_) =>
              MultiBlocProvider(
                providers: BlocProvidersManager.editProfileProviders,
                child: const EditProfileScreen(),
              ),
        );
      case Routes.notification:
        return buildRoute(
          prepareModule: DIModulesManger.prepareNotificationModule,
          providers: BlocProvidersManager.notificationProviders,
          screen: const NotificationScreen(),
        );
    }
  }

  static MaterialPageRoute buildRoute({
    required VoidCallback prepareModule,
    required List<BlocProvider> Function() providers,
    required Widget screen,
  }) {
    prepareModule();
    return MaterialPageRoute(
      builder: (_) =>
          MultiBlocProvider(
            providers: providers(),
            child: screen,
          ),
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
        const Scaffold(
          body: Center(
            child: Text(AppStrings.noRoute),
          ),
        ));
  }
}
