import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wasla/app/shared/common/bloc_observer.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/network/dio_factory.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/repositories/home_repository_impl.dart';
import 'package:wasla/domain/repositories/home_repository.dart';
import 'package:wasla/domain/usecases/auth_usecases/check_username_usecase.dart';
import 'package:wasla/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:wasla/domain/usecases/auth_usecases/register_usecase.dart';
import 'package:wasla/domain/usecases/home/get_notification_use_case.dart';
import 'package:wasla/domain/usecases/home/main/get_suggestions_trips_use_case.dart';
import 'package:wasla/domain/usecases/home/profile/edit_profile_use_case.dart';
import 'package:wasla/domain/usecases/home/profile/get_profile_use_case.dart';
import 'package:wasla/domain/usecases/verification_usecase/confirm_email_usecase.dart';
import 'package:wasla/domain/usecases/verification_usecase/edit_contact_usecase.dart';
import 'package:wasla/domain/usecases/verification_usecase/send_verification_email_usecase.dart';
import 'package:wasla/presentation/common/cubits/bear_cubit/bear_animation_cubit.dart';
import 'package:wasla/presentation/common/cubits/bear_dialog_cubit/bear_dialog_cubit.dart';
import 'package:wasla/presentation/common/rive_controller.dart';
import 'package:wasla/presentation/modules/account_verification/edit_contacts/cubit/edit_contacts_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/cubit/email_verify_cubit.dart';
import 'package:wasla/presentation/modules/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:wasla/presentation/modules/home/home/cubit/home_cubit.dart';
import 'package:wasla/presentation/modules/home/main/cubit/main_home_cubit.dart';
import 'package:wasla/presentation/modules/notification/cubit/notification_cubit.dart';
import 'package:wasla/presentation/modules/register/bloc/check_username_bloc.dart';
import 'package:wasla/presentation/modules/register/cubit/form_index_cubit.dart';
import 'package:wasla/presentation/modules/register/cubit/register_cubit.dart';

final GetIt getIt = GetIt.instance;

final class DIModulesManger {
  static Future<void> prepareAppModule() async {
    //get it
    getIt.allowReassignment = true;

    //bloc
    if (kDebugMode) {
      getIt.registerLazySingleton<MyBlocObserver>(() => MyBlocObserver());
    }

    //shared preferences
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    //app preferences
    getIt.registerLazySingleton<AppPreferences>(
        () => AppPreferences(sharedPreferences: getIt<SharedPreferences>()));

    //network checker
    getIt.registerLazySingleton<NetworkChecker>(() =>
        NetworkCheckerImpl(connectionChecker: InternetConnectionChecker()));

    //dio factory
    final Dio dio = Dio();
    getIt.registerLazySingleton<Dio>(() => dio);
    getIt.registerLazySingleton<DioFactory>(() => DioFactory(
          appPreferences: getIt<AppPreferences>(),
          dio: getIt<Dio>(),
        ));

    // api service client
    final Dio getDio = await getIt<DioFactory>().getDio();
    getIt.registerLazySingleton<ApiServiceClient>(
        () => ApiServiceClient(getDio));

    //remote data source
    getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
        apiServiceClient: getIt<ApiServiceClient>(),
        appPreferences: getIt<AppPreferences>()));

    //local data source
    getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

    //repository
    getIt.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl(
        remoteDataSource: getIt<RemoteDataSource>(),
        localDataSource: getIt<LocalDataSource>(),
        networkChecker: getIt<NetworkChecker>(),
        apiServiceClient: getIt<ApiServiceClient>()));

    //cubit
    getIt.registerFactory<LocalCubit>(
        () => LocalCubit(localDataSource: getIt<LocalDataSource>()));
  }

  static void _registerFactory<T extends Object>(T object) {
    bool isRegistered = GetIt.I.isRegistered<T>();

    if (!isRegistered) {
      getIt.registerFactory<T>(() => object);
    }

    _printHint<T>(isRegistered);
  }

  static void _printHint<T extends Object>(bool isRegistered) {
    if (isRegistered) {
      PrintManager.printHint(
        '$T is already registered factory no thing new',
      );
    } else {
      PrintManager.printHint(
        '$T is registered factory',
      );
    }
  }

  static void _printIsRegistered<T extends Object>() {
    PrintManager.printHint(
      '$T is registered factory',
    );
  }

  static void _registerFactoryBloc<TYPE extends Bloc>(TYPE bloc) {
    if (!(GetIt.I.isRegistered<TYPE>() && getIt<TYPE>().isClosed)) {
      getIt.registerFactory<TYPE>(() => bloc);
      PrintManager.print("${bloc.toString()} is registered factory",
          color: ConsoleColor.brightBlack);
    } else {
      PrintManager.print("${bloc.toString()} is not registered factory",
          color: ConsoleColor.brightRed);
    }
  }

  static void _registerFactoryCubit<TYPE extends Cubit>(TYPE cubit) {
    if (!GetIt.I.isRegistered<TYPE>()) {
      getIt.registerFactory<TYPE>(() => cubit);
      PrintManager.print("${cubit.toString()} is registered factory",
          color: ConsoleColor.brightBlack);

      PrintManager.print("cubit.isClosed ${getIt<TYPE>().isClosed} ",
          color: ConsoleColor.redBg);
    } else {
      PrintManager.print("${cubit.toString()} is not registered factory",
          color: ConsoleColor.brightRed);
    }
  }

  static void disposeBloc<T extends BlocBase>() {
    getIt<T>().close();

    getIt.unregister<T>();
    if (!(GetIt.I.isRegistered<T>())) {
      PrintManager.printHint(
        '$T is unregistered',
      );
    }
  }

  static void prepareOnboardingModule() {
    _registerFactory<OnboardingCubit>(OnboardingCubit());
    _registerFactory<OnChangeOnBoardingPageCubit>(
        OnChangeOnBoardingPageCubit());
  }

  static void _prepareAuthModule() {
    _registerFactory<AuthRepository>(AuthRepositoryImpl(
      remoteDataSource: getIt<RemoteDataSource>(),
      localDataSource: getIt<LocalDataSource>(),
      networkChecker: getIt<NetworkChecker>(),
      apiServiceClient: getIt<ApiServiceClient>(),
    ));

    ///ui
    _registerFactory<RiveControllerManager>(RiveControllerManager());
    //cubits used on auth
    _registerFactory<BearAnimationCubit>(
        BearAnimationCubit(getIt<RiveControllerManager>()));
    _registerFactory<BearDialogCubit>(BearDialogCubit());
  }

  static void prepareLoginModule() {
    _prepareAuthModule();

    ///use case
    _registerFactory<LoginUseCase>(
        LoginUseCase(repository: getIt<AuthRepository>()));

    ///cubit
    // _registerFactory<LoginCubit>(LoginCubit(getIt<LoginUseCase>()));

    if (!(GetIt.I.isRegistered<LoginCubit>())) {
      getIt
          .registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>()));
      _printIsRegistered<LoginCubit>();
    }

    // _registerFactoryCubit<LoginCubit>(LoginCubit(getIt<LoginUseCase>()));
  }

  static void prepareRegisterModule() {
    _prepareAuthModule();

    ///use case
    _registerFactory<CheckUsernameUseCase>(
        CheckUsernameUseCase(repository: getIt<AuthRepository>()));
    _registerFactory<RegisterUseCase>(
        RegisterUseCase(repository: getIt<AuthRepository>()));

    ///cubit

    // _registerFactory<RegisterCubit>(RegisterCubit(getIt<RegisterUseCase>()));
    // _registerFactory<CheckUsernameBloc>(
    //     CheckUsernameBloc(getIt<CheckUsernameUseCase>()));
    // _registerFactory<FormIndexCubit>(FormIndexCubit());

    if (!GetIt.I.isRegistered<RegisterCubit>()) {
      getIt.registerFactory<RegisterCubit>(
          () => RegisterCubit(getIt<RegisterUseCase>()));

      _printIsRegistered<RegisterCubit>();
    }
    if (!GetIt.I.isRegistered<CheckUsernameBloc>()) {
      getIt.registerFactory<CheckUsernameBloc>(
          () => CheckUsernameBloc(getIt<CheckUsernameUseCase>()));

      _printIsRegistered<CheckUsernameBloc>();
    }
    if (!GetIt.I.isRegistered<FormIndexCubit>()) {
      getIt.registerFactory<FormIndexCubit>(() => FormIndexCubit());

      _printIsRegistered<FormIndexCubit>();
    }
  }

  static void prepareVerificationModule() {
    _prepareAuthModule();

    //edit use cases
    _registerFactory<EditEmailUseCase>(
        EditEmailUseCase(repository: getIt<AuthRepository>()));
    _registerFactory<EditPhoneUseCase>(
        EditPhoneUseCase(repository: getIt<AuthRepository>()));

    //verify use cases
    _registerFactory<SendVerificationEmailUseCase>(
        SendVerificationEmailUseCase(repository: getIt<AuthRepository>()));
    _registerFactory<ConfirmEmailUseCase>(
        ConfirmEmailUseCase(repository: getIt<AuthRepository>()));

    //cubits
    if (!GetIt.I.isRegistered<EditContactsCubit>()) {
      getIt.registerFactory<EditContactsCubit>(() => EditContactsCubit(
            editEmailUseCase: getIt<EditEmailUseCase>(),
            editPhoneUseCase: getIt<EditPhoneUseCase>(),
          ));

      _printIsRegistered<EditContactsCubit>();
    }

    if (!GetIt.I.isRegistered<EmailVerifyCubit>()) {
      getIt.registerFactory<EmailVerifyCubit>(
        () => EmailVerifyCubit(
            sendVerificationEmailUseCase: getIt<SendVerificationEmailUseCase>(),
            confirmEmailUseCase: getIt<ConfirmEmailUseCase>()),
      );

      _printIsRegistered<EmailVerifyCubit>();
    }
  }

  static void prepareHomeModule() {
    _prepareAuthModule();

    //cubits
    //home cubit
    if (!GetIt.I.isRegistered<HomeCubit>()) {
      getIt.registerFactory<HomeCubit>(() => HomeCubit());

      _printIsRegistered<HomeCubit>();
    }

    //main home
    prepareMainModule();
    prepareProfileModule();
  }

  static void prepareMainModule() {
    _prepareAuthModule();

    //use case
    _registerFactory<GetSuggestionsTripsUseCase>(
        GetSuggestionsTripsUseCase(repository: getIt<AuthRepository>()));

    //cubits
    if (!GetIt.I.isRegistered<MainHomeCubit>()) {
      getIt.registerFactory<MainHomeCubit>(() => MainHomeCubit(
          getSuggestionsTripsUseCase: getIt<GetSuggestionsTripsUseCase>()));

      _printIsRegistered<MainHomeCubit>();
    }
  }

  static void prepareProfileModule() {
    _prepareAuthModule();

    //use case
    _registerFactory<GetProfileUseCase>(
        GetProfileUseCase(repository: getIt<AuthRepository>()));

    //cubits
    // if (!GetIt.I.isRegistered<ProfileCubit>()) {
    //   getIt.registerFactory<ProfileCubit>(
    //       () => ProfileCubit(getProfileUseCase: getIt<GetProfileUseCase>()));
    //
    //   _printIsRegistered<ProfileCubit>();
    // }
  }

  static void prepareEditProfileModule() {
    _prepareAuthModule();

    ///use case
    _registerFactory<CheckUsernameUseCase>(
        CheckUsernameUseCase(repository: getIt<AuthRepository>()));
    _registerFactory<EditProfileUseCase>(
        EditProfileUseCase(repository: getIt<AuthRepository>()));

    ///cubit

    if (!GetIt.I.isRegistered<CheckUsernameBloc>()) {
      getIt.registerFactory<CheckUsernameBloc>(
          () => CheckUsernameBloc(getIt<CheckUsernameUseCase>()));

      _printIsRegistered<CheckUsernameBloc>();
    }
    if (!GetIt.I.isRegistered<EditProfileCubit>()) {
      getIt.registerFactory<EditProfileCubit>(
          () => EditProfileCubit(getIt<EditProfileUseCase>()));

      _printIsRegistered<EditProfileCubit>();
    }
  }

  static void _prepareHomeModule() {
    _registerFactory<HomeRepository>(HomeRepositoryImpl(
      remoteDataSource: getIt<RemoteDataSource>(),
      localDataSource: getIt<LocalDataSource>(),
      networkChecker: getIt<NetworkChecker>(),
      apiServiceClient: getIt<ApiServiceClient>(),
    ));

    ///ui
    _registerFactory<RiveControllerManager>(RiveControllerManager());
    //cubits used on auth
    _registerFactory<BearAnimationCubit>(
        BearAnimationCubit(getIt<RiveControllerManager>()));
    _registerFactory<BearDialogCubit>(BearDialogCubit());
  }

  static void prepareNotificationModule() {
    _prepareHomeModule();

    ///use case
    _registerFactory<GetNotificationUseCase>(
        GetNotificationUseCase(repository: getIt<HomeRepository>()));

    ///cubit
    if (!GetIt.I.isRegistered<NotificationCubit>()) {
      getIt.registerFactory<NotificationCubit>(
          () => NotificationCubit(getIt<GetNotificationUseCase>()));

      _printIsRegistered<NotificationCubit>();
    }
  }
}
