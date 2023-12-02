import 'package:wasla/app/shared/common/common_libs.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Padding(
      padding: EdgeInsets.only(
          top: responsive.getScreenHeightPercentage(AppSize.s3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //todo RichText(text: text)
          //todo text
          Text(
            'ليس لديك حساب ..... ',
            style: getExtraLightStyle(
              color: ColorsManager.offWhite400,
              fontSize: FontSize.s22.sp,
            ),
          ),
          TextButton(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                      getRegularStyle(fontSize: FontSize.s28.sp))),
              onPressed: () {},
              child: Text('سجل الأن'))
        ],
      ),
    );
  }
}
