import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  final bool success;
  final String message;

  const BaseModel({required this.success, required this.message});

  @override
  List<Object> get props => [success, message];
}
