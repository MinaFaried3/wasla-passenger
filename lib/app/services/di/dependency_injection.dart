import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wasla/app/shared/common/bloc_observer.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/network/api_service_client.dart';
import 'package:wasla/data/network/dio_factory.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/domain/entities/login_models/rive_controller.dart';
import 'package:wasla/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:wasla/presentation/modules/login/cubit/bear_animation_cubit.dart';

final GetIt getIt = GetIt.instance;

final class DIModulesManger {
  static Future<void> prepareAppModule() async {
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
    getIt.registerLazySingleton<RemoteDataSource>(() =>
        RemoteDataSourceImpl(apiServiceClient: getIt<ApiServiceClient>()));

    //repository
  }

  static void _registerFactory<TYPE extends Object>(TYPE object) {
    if (!GetIt.I.isRegistered<TYPE>()) {
      getIt.registerFactory<TYPE>(() => object);

      PrintManager.printColoredText(
          "${object.toString()} is registered factory",
          color: ConsoleColor.brightBlack);
    }
  }

  static void prepareOnboardingModule() {
    _registerFactory<OnboardingCubit>(OnboardingCubit());
    _registerFactory<OnChangeOnBoardingPageCubit>(
        OnChangeOnBoardingPageCubit());
  }

  static void prepareAuthModule() {
    _registerFactory<AuthRepository>(AuthRepositoryImpl(
      remoteDataSource: getIt<RemoteDataSource>(),
      networkChecker: getIt<NetworkChecker>(),
    ));
  }

  static void prepareLoginModule() {
    prepareAuthModule();

    _registerFactory<RiveControllerManager>(RiveControllerManager());
    _registerFactory<BearAnimationCubit>(
        BearAnimationCubit(getIt<RiveControllerManager>()));
    _registerFactory<LoginUseCase>(
        LoginUseCase(repository: getIt<AuthRepository>()));
    _registerFactory<LoginCubit>(LoginCubit(getIt<LoginUseCase>()));
  }
}
