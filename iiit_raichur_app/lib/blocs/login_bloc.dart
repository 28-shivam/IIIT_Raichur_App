import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // Simulate network request delay
      await Future.delayed(Duration(seconds: 2));

      // Dummy authentication
      if (event.username == "user" && event.password == "password") {
        emit(state.copyWith(isLoading: false, errorMessage: null));
      } else {
        emit(
          state.copyWith(isLoading: false, errorMessage: "Invalid credentials"),
        );
      }
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
  }
}
