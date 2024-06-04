import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wasla/domain/entities/home/trip_suggestion_model.dart';
import 'package:wasla/domain/usecases/home/main/get_suggestions_trips_use_case.dart';

part 'main_home_cubit.freezed.dart';
part 'main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  final GetSuggestionsTripsUseCase getSuggestionsTripsUseCase;

  MainHomeCubit({required this.getSuggestionsTripsUseCase})
      : super(const MainHomeState.initial());

  void getSuggestionsTrips() async {
    emit(const MainHomeState.loading());

    final result = await getSuggestionsTripsUseCase(Void);

    result.fold(
      (l) {
        emit(MainHomeState.getSuggestionsTripsFailure(message: l.message));
      },
      (r) {
        emit(MainHomeState.getSuggestionsTripsSuccess(trips: r));
      },
    );
  }
}
