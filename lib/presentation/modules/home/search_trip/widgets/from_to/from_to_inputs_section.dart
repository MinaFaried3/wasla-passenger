import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/search_trip/widgets/from_to/chart.dart';
import 'package:wasla/presentation/modules/home/search_trip/widgets/from_to/inputs_field.dart';

class FromToInputsSection extends StatelessWidget {
  const FromToInputsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppPadding.leftRight,
      child: Column(
        children: [
          FromToChart(),
          FromToInputsFields(),
        ],
      ),
    );
  }
}
