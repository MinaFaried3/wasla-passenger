import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';
import 'package:wasla/presentation/modules/home/search_trip/widgets/from_to/from_to_inputs_section.dart';
import 'package:wasla/presentation/modules/home/search_trip/widgets/passengers_count/passengers_count_section.dart';
import 'package:wasla/presentation/modules/home/search_trip/widgets/trip_date/trip_date_picker_section.dart';
import 'package:wasla/presentation/modules/home/search_trip/widgets/trip_time/trip_time_picker_section.dart';

class SearchTripBody extends StatelessWidget {
  const SearchTripBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          //from to inputs
          const FromToInputsSection(),

          //date picker
          const TripDatePickerSection(),

          //time picker
          const TripTimePickerSection(),

          //tickets count
          const PassengersCountSection(),

          //search
          AppButton(
              buttonType: ButtonContentType.iconText,
              svgIconPath: AssetsProvider.searchIcon,
              text: AppStrings.searchForTrip.tr(),
              matchFontColor: true,
              onPressed: () {}),

          VerticalSpace(100.h),
        ],
      ),
    );
  }
}
