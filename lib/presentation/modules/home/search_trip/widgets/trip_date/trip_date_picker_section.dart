import 'package:flutter/cupertino.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/search_trip/trip_search_cubit.dart';
import 'package:wasla/presentation/widgets/date_picker/date_picker.dart';
import 'package:wasla/presentation/widgets/section/section_with_tittle.dart';

class TripDatePickerSection extends StatefulWidget {
  const TripDatePickerSection({
    super.key,
  });

  @override
  State<TripDatePickerSection> createState() => _TripDatePickerSectionState();
}

class _TripDatePickerSectionState extends State<TripDatePickerSection> {
  bool active = false;
  DateTime? currentSelectedDate;
  final DatePickerController datePickerController = DatePickerController();
  final int dayCount = 30;
  late List<DateTime> inactiveDate;
  List<DateTime> currentInactiveDate = [];

  @override
  void initState() {
    super.initState();
    initInactiveDates();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: CupertinoSwitch(
            value: active,
            activeColor: ColorsManager.tealPrimary800,
            onLabelColor: ColorsManager.twine,
            thumbColor: active
                ? ColorsManager.offWhite300
                : ColorsManager.tealPrimary800,
            trackColor: ColorsManager.tealPrimary1000,
            onChanged: onSwitchButtonPressed,
          ),
        ),
        SectionWithTitle(
            iconPath: AssetsProvider.calendarIcon,
            tittle: AppStrings.takeOffDate.tr(),
            content: DatePicker(
              controller: datePickerController,
              DateTime.now(),
              height: 140.h,
              width: 80.w,
              inactiveDates: currentInactiveDate,
              directionality: Directionality.of(context),
              onDateChange: onDateSelected,
              daysCount: dayCount,
              locale: Localizations.localeOf(context).toString(),
              dateTextStyle: getBoldStyle(
                  color: ColorsManager.tealPrimary300, fontSize: 20.sp),
              dayTextStyle: getRegularStyle(
                  color: ColorsManager.tealPrimary700, fontSize: 14.sp),
              monthTextStyle: getRegularStyle(
                  color: ColorsManager.tealPrimary700, fontSize: 14.sp),
              selectionColor: ColorsManager.tealPrimary900,
              selectedTextColor: ColorsManager.tealPrimary300,
              deactivatedColor: ColorsManager.tealPrimary1000,
            )),
      ],
    );
  }

  void onDateSelected(DateTime dateTime) {
    currentSelectedDate = dateTime;
    if (active) {
      datePickerController.setDateAndAnimate(currentSelectedDate!);
      context.read<TripSearchCubit>().onChangeDate(currentSelectedDate);
    }
    PrintManager.print(context.read<TripSearchCubit>().date);
  }

  void onSwitchButtonPressed(bool val) {
    setState(() {
      active = val;
    });
    currentSelectedDate ??= DateTime.now();
    if (active) {
      datePickerController.setDateAndAnimate(currentSelectedDate!);
      context.read<TripSearchCubit>().onChangeDate(currentSelectedDate);
      currentInactiveDate = [];
    } else {
      currentInactiveDate = inactiveDate;
      context.read<TripSearchCubit>().onChangeDate(null);
    }
    PrintManager.print(context.read<TripSearchCubit>().date);
  }

  void initInactiveDates() {
    DateTime day = DateTime.now();
    inactiveDate = List.generate(30, (index) {
      if (index != 0) {
        day = day.add(const Duration(days: 1));
      }
      return day;
    });
    currentInactiveDate = inactiveDate;
  }
}
