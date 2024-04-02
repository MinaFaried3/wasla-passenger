part of 'local_cubit.dart';

@freezed
class LocalState with _$LocalState {
  const factory LocalState.initial() = _InitialState;

  const factory LocalState.getLocalPassengerLoading() =
      _GetLocalPassengerLoadingState;

  const factory LocalState.getLocalPassengerSuccess(
          {required PassengerModel passengerModel}) =
      _GetLocalPassengerSuccessState;

  const factory LocalState.getLocalPassengerFailure(
      {required String failureMessage}) = _GetLocalPassengerFailureState;
}
