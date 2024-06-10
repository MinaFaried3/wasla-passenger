import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/domain/entities/home/profile_model.dart';
import 'package:wasla/domain/usecases/home/profile/get_profile_use_case.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase})
      : super(const ProfileState.initial());
  List<UserTileModel> followers = [];
  List<UserTileModel> following = [];

  void getProfile() async {
    emit(const ProfileState.loading());

    final result = await getProfileUseCase(Void);

    result.fold(
      (l) {
        emit(ProfileState.getProfileFailure(message: l.message));
      },
      (r) {
        followers =
            List.generate(r.followers.length, (idx) => r.followers[idx]);
        following =
            List.generate(r.following.length, (idx) => r.following[idx]);
        emit(ProfileState.getProfileSuccess(profile: r));
      },
    );
  }

  void failState() =>
      emit(ProfileState.getProfileFailure(message: 'خاول مرة اخري'));
}
