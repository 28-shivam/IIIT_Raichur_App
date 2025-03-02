import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../../data/repositories/auth/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true));

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
