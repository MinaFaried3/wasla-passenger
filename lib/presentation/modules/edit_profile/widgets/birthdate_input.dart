import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/helper_functions.dart';
import 'package:wasla/data/data_source/local_data_source.dart';
import 'package:wasla/presentation/modules/edit_profile/cubit/edit_profile_cubit.dart';

class BirthdateInput extends StatefulWidget {
  const BirthdateInput({super.key});

  @override
  State<BirthdateInput> createState() => _BirthdateInputState();
}

class _BirthdateInputState extends State<BirthdateInput> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PassengerModel>(
      future: getIt<LocalDataSource>().getPassengerModel(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          date = DateTime.tryParse(snapshot.data?.birthdate ?? '');
          PrintManager.print(date, color: ConsoleColor.yellow);
        }

        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ColorsManager.darkTeal,
              borderRadius: BorderRadius.circular(20)),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Row(
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        await _selectDate(context);
                        setState(() {});
                      },
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(8))),
                      child: FittedBox(child: Text(AppStrings.birthdate.tr()))),
                  const HorizontalSpace(10),
                  Flexible(
                    child: Text(
                      _formatDate(),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: getMediumStyle(
                          fontSize: 20.sp, color: ColorsManager.twine),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != date) {
      date = picked;
      if (context.mounted) {
        context.read<EditProfileCubit>().editProfileRequest = context
            .read<EditProfileCubit>()
            .editProfileRequest
            .copyWith(birthdate: formatDateTimeForServer(date!));
      }
    }
  }

  String _formatDate() {
    if (date == null) return '';
    return DateFormat('dd, MMM yyyy').format(date!);
  }
}
