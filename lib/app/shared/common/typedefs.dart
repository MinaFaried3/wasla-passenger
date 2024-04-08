import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/entities/base_model.dart';

typedef Json = Map<String, dynamic>;

typedef FailureOr<X> = Future<Either<Failure, X>>;
typedef FailureOrPassengerModel = FailureOr<PassengerModel>;
typedef FailureOrBaseModel = FailureOr<BaseModel>;
