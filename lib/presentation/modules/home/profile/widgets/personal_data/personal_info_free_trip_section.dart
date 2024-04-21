import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/free_trip_chart.dart';
import 'package:wasla/presentation/modules/home/profile/widgets/personal_data/personal_info.dart';

class PersonalInfoAndFreeTripChart extends StatelessWidget {
  const PersonalInfoAndFreeTripChart({
    super.key,
    required this.id,
    required this.phone,
    required this.email,
    required this.birthdate,
    required this.maleOrFemale,
    required this.points,
  });

  final String id;
  final String phone;
  final String email;
  final String birthdate;
  final String maleOrFemale;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PersonalInfo(
            id: id,
            phone: phone,
            email: email,
            birthdate: birthdate,
            maleOrFemale: maleOrFemale,
          ),
        ),
        FreeTripChart(points: points)
      ],
    );
  }
}
