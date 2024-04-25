import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/section/section_with_tittle.dart';

class TripTimePickerSection extends StatelessWidget {
  const TripTimePickerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      tittle: AppStrings.takeOffTime.tr(),
      iconPath: AssetsProvider.clockIcon,
      content: Directionality(
        textDirection: TextDirection.ltr,
        child: TimePickerSpinner(
          is24HourMode: false,
          highlightedTextStyle: getBoldStyle(
              fontSize: 18.sp, color: ColorsManager.tealPrimary400),
          normalTextStyle: getLightStyle(),
          itemWidth: 70,
          spacing: 5,
          onTimeChange: (time) {},
        ),
      ),
    );
  }
}
