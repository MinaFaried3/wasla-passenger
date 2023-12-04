import 'package:wasla/app/shared/common/common_libs.dart';

class ContactsFormFields extends StatelessWidget {
  const ContactsFormFields({super.key, required this.contactsFormKey});

  final GlobalKey<FormState> contactsFormKey;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_03);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);
    return Form(
      key: contactsFormKey,
      child: Column(
        children: [
          //email filed
          Padding(
            padding: edgeInsetsBottom,
            child: AppTextFormField(
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.next,
              labelText: AppStrings.email.tr(),
              svgPrefixPath: AssetsProvider.emailIcon,
            ),
          ),

          //phone filed
          Padding(
            padding: edgeInsetsBottom,
            child: AppTextFormField(
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.next,
              labelText: AppStrings.phone.tr(),
              svgPrefixPath: AssetsProvider.phoneIcon,
            ),
          ),
        ],
      ),
    );
  }
}
