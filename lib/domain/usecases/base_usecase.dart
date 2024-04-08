import 'package:wasla/app/shared/common/common_libs.dart';

abstract class BaseUseCase<Input, Output, Repository> {
  final Repository repository;

  const BaseUseCase({required this.repository});

  FailureOr<Output> call(Input input);
}
