import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/search_trip/trip_search_cubit.dart';
import 'package:wasla/presentation/widgets/date_picker/date_picker.dart';
import 'package:wasla/presentation/widgets/section/section_with_tittle.dart';

class TripDatePickerSection extends StatelessWidget {
  const TripDatePickerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
        iconPath: AssetsProvider.calendarIcon,
        tittle: AppStrings.takeOffDate.tr(),
        content: DatePicker(
          DateTime.now(),
          height: 140.h,
          width: 80.w,
          directionality: Directionality.of(context),
          onDateChange: (dateTime) {
            context.read<TripSearchCubit>().onChangeDate(dateTime);
            context.read<TripSearchCubit>().selected = true;
            PrintManager.print(context.read<TripSearchCubit>().date);
          },
          daysCount: 30,
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
        ));
  }
}
