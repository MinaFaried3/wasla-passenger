import 'package:equatable/equatable.dart';

final class ModelResponse<T> extends Equatable {
  final String? message;
  final T model;

  const ModelResponse({this.message, required this.model});

  @override
  List<Object?> get props => [message, model];
}
