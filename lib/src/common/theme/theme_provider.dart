import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_provider_event.dart';
part 'theme_provider_state.dart';
part 'theme_provider.freezed.dart';

class ThemeProviderBloc extends HydratedBloc<ThemeProviderEvent, ThemeProviderState> {
  ThemeProviderBloc() : super(const ThemeProviderState.light()) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeProviderState> emit) {
    emit(state.when(
      light: () => const ThemeProviderState.dark(),
      dark: () => const ThemeProviderState.light(),
    ));
  }

  @override
  ThemeProviderState? fromJson(Map<String, dynamic> json) {
    final isDark = json['isDark'] as bool? ?? false;
    return isDark ? const ThemeProviderState.dark() : const ThemeProviderState.light();
  }

  @override
  Map<String, dynamic>? toJson(ThemeProviderState state) {
    return state.when(
      light: () => {'isDark': false},
      dark: () => {'isDark': true},
    );
  }
}
