import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/data/requests/home/profile/edit_profile_request.dart';
import 'package:wasla/domain/usecases/home/profile/edit_profile_use_case.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.editProfileUseCase)
      : super(const EditProfileState.initial()) {
    assignEditProfileObject();
  }

  Future<void> assignEditProfileObject() async {
    final passenger = await getIt<LocalDataSource>().getPassengerModel();
    editProfileRequest = EditProfileRequest(
        firstname: passenger.firstName,
        lastname: passenger.lastName,
        username: passenger.userName,
        email: passenger.connections.email,
        phone: passenger.connections.phone,
        birthdate: passenger.birthdate,
        gender: passenger.gender,
        profileImage: null);
  }

  final EditProfileUseCase editProfileUseCase;

  late EditProfileRequest editProfileRequest;

  void editProfile() async {
    PrintManager.print(
        editProfileRequest.profileImage?.path ?? "=============error",
        color: ConsoleColor.yellow);
    emit(const EditProfileState.loading());
    final result = await editProfileUseCase(editProfileRequest);
    result.fold(
        (l) => emit(EditProfileState.editProfileFailure(message: l.message)),
        (r) => emit(const EditProfileState.editProfileSuccess()));
  }
}
