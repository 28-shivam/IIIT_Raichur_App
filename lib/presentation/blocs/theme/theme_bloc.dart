import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/themes/theme.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppThemes.lightTheme)) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(event.theme));
    });
  }
}
