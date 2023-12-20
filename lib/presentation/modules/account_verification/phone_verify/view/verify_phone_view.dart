import 'package:wasla/app/shared/common/common_libs.dart';

class VerifyPhoneScreen extends StatelessWidget {
  final String phone;

  const VerifyPhoneScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(phone)),
    );
  }
}
