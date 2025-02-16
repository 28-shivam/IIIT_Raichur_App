import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'example_event.dart';
import 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleInitial()) {
    on<FetchDataEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
    FetchDataEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoading());
    try {
      // Simulate data fetching
      await Future.delayed(const Duration(seconds: 2));
      emit(ExampleLoaded("Data fetched successfully!"));
    } catch (e) {
      emit(ExampleError("Failed to fetch data"));
    }
  }
}
