import 'package:flutter/cupertino.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/search_trip/trip_search_cubit.dart';
import 'package:wasla/presentation/widgets/section/section_with_tittle.dart';

class TripTimePickerSection extends StatefulWidget {
  const TripTimePickerSection({
    super.key,
  });

  @override
  State<TripTimePickerSection> createState() => _TripTimePickerSectionState();
}

class _TripTimePickerSectionState extends State<TripTimePickerSection> {
  bool active = false;
  TimeOfDay? currentSelectedTime;
  TimeOfDay time = TimeOfDay.fromDateTime(DateTime.now());

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
            onChanged: (val) {
              setState(() {
                active = val;
              });
              currentSelectedTime ??= time;
              if (active) {
                context
                    .read<TripSearchCubit>()
                    .onChangeTime(currentSelectedTime);
              } else {
                context.read<TripSearchCubit>().onChangeTime(null);
              }
              PrintManager.print(context.read<TripSearchCubit>().time);
            },
          ),
        ),
        SectionWithTitle(
          tittle: AppStrings.takeOffTime.tr(),
          iconPath: AssetsProvider.clockIcon,
          content: Directionality(
            textDirection: TextDirection.ltr,
            child: TimePickerSpinner(
              is24HourMode: false,
              highlightedTextStyle: getBoldStyle(
                  fontSize: 18.sp,
                  color: active
                      ? ColorsManager.tealPrimary400
                      : ColorsManager.tealPrimary1000),
              normalTextStyle: getLightStyle(),
              itemWidth: 70,
              spacing: 5,
              onTimeChange: (newTime) {
                if (active) {
                  context
                      .read<TripSearchCubit>()
                      .onChangeTime(TimeOfDay.fromDateTime(newTime));
                  PrintManager.print(context.read<TripSearchCubit>().time);
                }
                PrintManager.print(newTime, color: ConsoleColor.blue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
