import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';
import 'package:wasla/domain/usecases/base_usecase.dart';

final class GetSuggestionsTripsUseCase extends ParameterizedBaseUseCase<void,
    List<SuggestionTripModel>, AuthRepository> {
  const GetSuggestionsTripsUseCase({required super.repository});

  @override
  FailureOr<List<SuggestionTripModel>> call(void input) async {
    return await repository.getSuggestionTrips();
  }
}
