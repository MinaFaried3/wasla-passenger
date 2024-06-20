import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/app/shared/extensions/not_nullable_extensions.dart';
import 'package:wasla/domain/usecases/verification_usecase/edit_contact_usecase.dart';

part 'edit_contacts_cubit.freezed.dart';
part 'edit_contacts_state.dart';

class EditContactsCubit extends Cubit<EditContactsState> {
  final EditEmailUseCase editEmailUseCase;
  final EditPhoneUseCase editPhoneUseCase;

  EditContactsCubit({
    required this.editEmailUseCase,
    required this.editPhoneUseCase,
  }) : super(const EditContactsState.initial());

  void editEmail(String email) async {
    emit(const EditContactsState.loadingState());

    final result = await editEmailUseCase(email);
    result.fold((l) {
      emit(EditContactsState.editEmailFailureState(l.message));
    }, (r) {
      emit(EditContactsState.editEmailSuccessState(r.message.orEmpty()));
    });
  }

  void editPhone(String phone) async {
    emit(const EditContactsState.loadingState());

    final result = await editPhoneUseCase(phone);
    result.fold((l) {
      emit(EditContactsState.editPhoneFailureState(l.message));
    }, (r) {
      emit(EditContactsState.editPhoneSuccessState(r.message.orEmpty()));
    });
  }
}
