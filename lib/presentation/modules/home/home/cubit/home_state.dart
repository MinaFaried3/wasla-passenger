part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(HomeContentItem homeContentItem) = _Initial;

  const factory HomeState.changeBodyContent(HomeContentItem homeContentItem) =
      _ChangeBodyContentState;
}
