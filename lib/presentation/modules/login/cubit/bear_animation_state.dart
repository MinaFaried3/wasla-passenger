part of 'bear_animation_cubit.dart';

@freezed
class BearAnimationState with _$BearAnimationState {
  const factory BearAnimationState.init() = _Initial;

  const factory BearAnimationState.loading() = _Loading;

  const factory BearAnimationState.loadedSuccessfully() = _LoadedSuccessfully;

  const factory BearAnimationState.error() = _Error;
}
