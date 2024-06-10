part of 'trip_search_cubit.dart';

@freezed
class TripSearchState with _$TripSearchState {
  const factory TripSearchState.initial() = _Initial;

  const factory TripSearchState.loading() = _loading;

  const factory TripSearchState.searchTripSuccess(
      {required TripSearchResultModel tripSearchModel}) = _searchTripSuccess;

  const factory TripSearchState.searchTripFailure({required String message}) =
      _searchTripFailure;
}
