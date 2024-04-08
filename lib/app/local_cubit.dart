import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';

part 'local_cubit.freezed.dart';
part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final LocalDataSource localDataSource;

  LocalCubit({required this.localDataSource})
      : super(const LocalState.initial());

  void getPassengerModelFromLocalDataBase() async {
    localStateHelper(callback: () async {
      PassengerModel passengerModel = await localDataSource.getPassengerModel();
      emit(LocalState.getLocalPassengerSuccess(passengerModel: passengerModel));
    });
  }

  void getPassengerModelConnections() async {
    localStateHelper(callback: () async {
      Connections connections =
          (await localDataSource.getPassengerModel()).connections;
      emit(LocalState.getLocalPassengerConnectionsSuccess(
          passengerConnections: connections));
    });
  }

  void localStateHelper({required VoidCallback callback}) async {
    emit(const LocalState.getLocalPassengerLoading());
    try {
      callback();
    } catch (error) {
      emit(LocalState.getLocalPassengerFailure(
          failureMessage: error.toString()));
    }
  }
}
