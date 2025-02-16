import 'package:equatable/equatable.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object> get props => [];
}

class ExampleInitial extends ExampleState {}

class ExampleLoading extends ExampleState {}

class ExampleLoaded extends ExampleState {
  final String data;

  const ExampleLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class ExampleError extends ExampleState {
  final String message;

  const ExampleError(this.message);

  @override
  List<Object> get props => [message];
}
