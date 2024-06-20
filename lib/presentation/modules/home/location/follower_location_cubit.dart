import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/data/network/FollowerLocationResponse.dart';

part 'follower_location_cubit.freezed.dart';
part 'follower_location_state.dart';

class FollowerLocationCubit extends Cubit<FollowerLocationState> {
  FollowerLocationCubit() : super(const FollowerLocationState.initial());
}
