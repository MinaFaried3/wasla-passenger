import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/start/widgets/start_swipe_stack_body.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LocalCubit>().getPassengerModelFromLocalDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo overlay
      body: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return state.maybeWhen(getLocalPassengerLoading: () {
            return const LoadingIndicator();
          }, getLocalPassengerSuccess: (passengerModel) {
            return StartSwipeStackBody(passengerName: passengerModel.firstName);
          }, orElse: () {
            return const StartSwipeStackBody(
                passengerName: AppConstants.emptyString);
          });
        },
      ),
    );
  }
}
