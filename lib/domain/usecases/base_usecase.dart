import 'package:wasla/app/shared/common/typedefs.dart';
import 'package:wasla/data/repositories/base_repository.dart';

abstract class AbstractedBaseUseCase<Repository extends BaseRepository> {
  final Repository repository;

  const AbstractedBaseUseCase({required this.repository});
}

abstract class BaseUseCase<Output, Repository extends BaseRepository>
    extends AbstractedBaseUseCase<Repository> {
  const BaseUseCase({required super.repository});

  FailureOr<Output> call();
}

abstract class ParameterizedBaseUseCase<Input, Output,
        Repository extends BaseRepository>
    extends AbstractedBaseUseCase<Repository> {
  const ParameterizedBaseUseCase({required super.repository});

  FailureOr<Output> call(Input input);
}
