part of 'main_home_cubit.dart';

@freezed
class MainHomeState with _$MainHomeState {
  const factory MainHomeState.initial() = _Initial;

  const factory MainHomeState.loading() = _Loading;

  const factory MainHomeState.getSuggestionsTripsSuccess(
      {required List<SuggestionTripModel> trips}) = _GetSuggestionsTripsSuccess;

  const factory MainHomeState.getSuggestionsTripsFailure(
      {required String message}) = _GetSuggestionsTripsFailure;
}
