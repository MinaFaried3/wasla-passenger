import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/data/responses/base_response.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';

part 'suggestion_trips_response.g.dart';

@JsonSerializable()
final class SuggestionTripsResponse
    extends BaseResponse<List<SuggestionTripModel>> {
  const SuggestionTripsResponse({
    super.status,
    super.message,
    super.success,
    super.data,
  });

  //from json
  factory SuggestionTripsResponse.fromJson(Json json) =>
      _$SuggestionTripsResponseFromJson(json);

  //to json
  Json toJson() => _$SuggestionTripsResponseToJson(this);

  @override
  List<Object?> get props => [
        status,
        message,
        success,
        data,
      ];
}
