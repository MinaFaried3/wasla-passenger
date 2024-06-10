import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:wasla/app/services/di/dependency_injection.dart';
import 'package:wasla/app/shared/common/printer_manager.dart';
import 'package:wasla/data/repositories/auth_repository_impl.dart';
import 'package:wasla/data/responses/TripsSearchResponse.dart';

part 'trip_search_cubit.freezed.dart';
part 'trip_search_state.dart';

class TripSearchCubit extends Cubit<TripSearchState> {
  TripSearchCubit() : super(const TripSearchState.initial()) {
    DateTime dateTime = DateTime.now();
    date = DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  final AuthRepositoryImpl authRepositoryImpl = getIt<AuthRepositoryImpl>();

  String? from, to;
  late DateTime date;
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

  void onChangeTime(DateTime time) {
    date = date.copyWith(
      hour: time.hour,
      minute: time.minute,
    );
  }

  void onChangeDate(DateTime newDate) {
    date = newDate.copyWith(
      day: newDate.day,
      month: newDate.month,
      year: newDate.year,
      hour: date.hour,
      minute: date.minute,
    );
  }

  void removeTime() {
    date = DateTime(date.year, date.month, date.day);
  }

  void searchForTrip() async {
    // if (!canSearchForTrip()) return;
    PrintManager.print(date, color: ConsoleColor.greenBg);
    emit(TripSearchState.loading());
    final result = await authRepositoryImpl.searchForTrip(
        // from: from!, to: to!, date: selected?_formatDateTimeForServer(date):'');
        from: 'طهطا',
        to: 'سوهاج',
        date: selected ? _formatDateTimeForServer(date) : '');
    result.fold(
        (l) => emit(TripSearchState.searchTripFailure(message: l.message)),
        (r) => emit(TripSearchState.searchTripSuccess(tripSearchModel: r)));
  }

  void backToInitial() {
    emit(TripSearchState.initial());
  }

  String _formatDateTimeForServer(DateTime dateTime) {
    dateTime = dateTime.add(Duration(days: 1));
    final DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    PrintManager.print(formatter.format(dateTime.toUtc()),
        color: ConsoleColor.blueBg);
    PrintManager.print(dateTime, color: ConsoleColor.greenBg);
    return formatter.format(dateTime.toUtc());
  }
}
