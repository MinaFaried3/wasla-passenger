import 'package:wasla/app/shared/common/common_libs.dart';

part 'trip_suggestion_model.g.dart';

@JsonSerializable()
final class SuggestionTripModel extends Equatable {
  final int id;
  @JsonKey(name: 'comapnyName')
  final String companyName;
  final int companyRating;
  final String imageUrl;
  final String startTime;
  final String arrivalTime;
  final String from;
  final String to;
  final int price;

  const SuggestionTripModel(
      {required this.id,
      required this.companyName,
      required this.companyRating,
      required this.imageUrl,
      required this.startTime,
      required this.arrivalTime,
      required this.from,
      required this.to,
      required this.price});

  Json toJson() => _$SuggestionTripModelToJson(this);

  //from json
  factory SuggestionTripModel.fromJson(Json json) =>
      _$SuggestionTripModelFromJson(json);

  @override
  List<Object> get props => [
        id,
        companyName,
        companyRating,
        imageUrl,
        startTime,
        arrivalTime,
        from,
        to,
        price,
      ];

  @override
  String toString() {
    return 'SuggestionTripModel{id: $id, companyName: $companyName, companyRating: $companyRating, imageUrl: $imageUrl, startTime: $startTime, arrivalTime: $arrivalTime, from: $from, to: $to, price: $price}';
  }
}
