//record to domain
import 'package:wasla/data/responses/home/main/suggestion_trips_response.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';

extension SuggestionTripsResponseMapper on SuggestionTripsResponse? {
  List<SuggestionTripModel> toDomain() => this?.data ?? [];
}
