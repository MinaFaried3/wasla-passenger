import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/home/profile/get_profile_use_case.dart';
import 'package:wasla/presentation/common/cubits/password_icon_cubit/password_icon_cubit.dart';
import 'package:wasla/presentation/modules/follow_request/cubit/action_follow_request_cubit.dart';
import 'package:wasla/presentation/modules/follow_request/cubit/follow_request_cubit.dart';
import 'package:wasla/presentation/modules/home/main/add_following/cubit/create_follow_cubit.dart';
import 'package:wasla/presentation/modules/home/main/add_following/cubit/follow_cubit.dart';
import 'package:wasla/presentation/modules/home/my_tickets/cubit/coming_trip_cubit.dart';
import 'package:wasla/presentation/modules/home/profile/cubit/profile_cubit.dart';
import 'package:wasla/presentation/modules/home/search_trip/trip_search_cubit.dart';
import 'package:wasla/presentation/modules/searched_trip/cubit/public_trip_reserve_cubit.dart';
import 'package:wasla/presentation/modules/trip_reserve/cubit/org_trip_reserve_cubit.dart';
import 'package:wasla/presentation/modules/trip_reserve/cubit/trip_seats_cubit.dart';

final CreateFollowCubit createFollowCubit = CreateFollowCubit();
final FollowRequestCubit followRequestCubit = FollowRequestCubit();
final ActionFollowRequestCubit actionFollowRequestCubit =
    ActionFollowRequestCubit();

class WaslaApp extends StatefulWidget {
  final Routes route;

  //named constructor
  const WaslaApp._internal({required this.route});

  //singleton instance
  static WaslaApp? _instance;

  factory WaslaApp({required Routes route}) {
    _instance ??= WaslaApp._internal(route: route);
    return _instance!;
  }

  @override
  State<WaslaApp> createState() => _WaslaAppState();
}

class _WaslaAppState extends State<WaslaApp> {
  @override
  void didChangeDependencies() {
    context.setLocale(LocalizationManager.arabicLocal);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LocalCubit>(),
        ),
        BlocProvider(
          create: (context) => TripSearchCubit(),
        ),
        BlocProvider(
          create: (context) => FollowCubit(),
        ),
        BlocProvider(
          create: (context) => PublicTripReserveCubit(),
        ),
        BlocProvider(
          create: (context) => OrgTripReserveCubit(),
        ),
        BlocProvider(
          create: (context) => TripSeatsCubit(),
        ),
        BlocProvider(
          create: (context) => ComingTripCubit(),
        ),
        BlocProvider(
          create: (context) => createFollowCubit,
        ),
        BlocProvider(
          create: (context) => followRequestCubit,
        ),
        BlocProvider(
          create: (context) => actionFollowRequestCubit,
        ),
        BlocProvider<PasswordIconCubit>(
          create: (context) => PasswordIconCubit(),
        ),
        BlocProvider(
            create: (context) =>
                ProfileCubit(getProfileUseCase: getIt<GetProfileUseCase>())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstants.screenUtilWidth,
          AppConstants.screenUtilHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          darkTheme: getApplicationTheme(),
          themeMode: ThemeMode.dark,
          home: child,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: widget.route.path,
          // initialRoute: Routes.verificationWayRoute.path,
        ),
      ),
    );
  }
}
