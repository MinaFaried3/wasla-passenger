import 'package:equatable/equatable.dart';

class CheckUsernameModel extends Equatable {
  final bool valid;
  final String message;

  const CheckUsernameModel({
    required this.valid,
    required this.message,
  });

  @override
  List<Object> get props => [
        valid,
        message,
      ];
}
