import 'package:wasla/app/shared/common/common_libs.dart';

final class FormViewContent extends Equatable {
  final GlobalKey<FormState> key;
  final Widget form;

  const FormViewContent({
    required this.key,
    required this.form,
  });

  @override
  List<Object> get props => [
        form,
        key,
      ];
}

// final class FormsControllers extends Equatable {
//   //controllers
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController firstnameController = TextEditingController();
//   final TextEditingController lastnameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   //form keys
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> contactsFormKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
//
//   void dispose() {
//     //dispose controllers
//     usernameController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     firstnameController.dispose();
//     lastnameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//   }
//
//   @override
//   List<Object> get props => [
//         usernameController,
//         firstnameController,
//         lastnameController,
//         passwordController,
//         confirmPasswordController,
//         phoneController,
//         emailController,
//         formKey,
//         namesFormKey,
//         contactsFormKey,
//         passwordFormKey,
//       ];
// }
