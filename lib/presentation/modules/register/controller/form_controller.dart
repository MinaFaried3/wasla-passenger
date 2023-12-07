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
