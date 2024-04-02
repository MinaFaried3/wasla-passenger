import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';

part 'local_cubit.freezed.dart';
part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final LocalDataSource localDataSource;

  LocalCubit({required this.localDataSource})
      : super(const LocalState.initial());

  void getPassengerModelFromLocalDataBase() async {
    emit(const LocalState.getLocalPassengerLoading());
    try {
      PassengerModel passengerModel = await localDataSource.getPassengerModel();
      emit(LocalState.getLocalPassengerSuccess(passengerModel: passengerModel));
    } catch (error) {
      emit(LocalState.getLocalPassengerFailure(
          failureMessage: error.toString()));
    }
  }
}
