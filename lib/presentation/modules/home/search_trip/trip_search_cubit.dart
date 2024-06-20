import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/app/shared/common/printer_manager.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/responses/TripsSearchResponse.dart';

part 'trip_search_cubit.freezed.dart';
part 'trip_search_state.dart';

class TripSearchCubit extends Cubit<TripSearchState> {
  TripSearchCubit() : super(const TripSearchState.initial());

  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  String? from, to;
  DateTime? date;
  TimeOfDay? time;

  bool selected = false;

  bool canSearchForTrip() {
    return !(from == null || to == null || from!.isEmpty || to!.isEmpty);
  }

  void onChangeFrom(String str) {
    if (str.isEmpty) from = null;
    from = str;
  }

  void onChangeTo(String str) {
    if (str.isEmpty) to = null;
    to = str;
  }

  void onChangeDate(DateTime? newDate) {
    date = newDate;
  }

  void onChangeTime(TimeOfDay? newTime) {
    time = newTime;
  }

  void searchForTrip() async {
    if (!canSearchForTrip()) return;
    PrintManager.print(date, color: ConsoleColor.greenBg);
    emit(const TripSearchState.loading());
    final result = await authRepositoryImpl.searchForTrip(
      from: from!,
      to: to!,
      date: _formatDateTimeForServer(),
      time: _formatTimeOfDayForServer(),
    );
    result.fold(
        (l) => emit(TripSearchState.searchTripFailure(message: l.message)),
        (r) => emit(TripSearchState.searchTripSuccess(tripSearchModel: r)));
  }

  void backToInitial() {
    emit(TripSearchState.initial());
  }

  String _formatDateTimeForServer() {
    // dateTime = dateTime.add(Duration(days: 1));
    if (date == null) return '';
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    PrintManager.print(formatter.format(date!), color: ConsoleColor.blueBg);
    PrintManager.print(date!, color: ConsoleColor.greenBg);
    return formatter.format(date!);
  }

  String _formatTimeOfDayForServer() {
    if (time == null) return '';
    // Extract hour and minute
    int hour = time!.hour;
    int minute = time!.minute;

    // Format hour and minute as two-digit strings
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    PrintManager.print('$formattedHour:$formattedMinute',
        color: ConsoleColor.blueBg);
    PrintManager.print(time!, color: ConsoleColor.greenBg);
    // Combine formatted hour and minute
    return '$formattedHour:$formattedMinute';
  }
}
