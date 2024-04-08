part of 'edit_contacts_cubit.dart';

@freezed
class EditContactsState with _$EditContactsState {
  const factory EditContactsState.initial() = _Initial;

  const factory EditContactsState.loadingState() = _LoadingState;

  const factory EditContactsState.editEmailSuccessState(String message) =
      _EditEmailSuccessState;

  const factory EditContactsState.editEmailFailureState(String failureMessage) =
      _EditEmailFailureState;

  const factory EditContactsState.editPhoneSuccessState(String message) =
      _EditPhoneSuccessState;

  const factory EditContactsState.editPhoneFailureState(String failureMessage) =
      _EditPhoneFailureState;
}
