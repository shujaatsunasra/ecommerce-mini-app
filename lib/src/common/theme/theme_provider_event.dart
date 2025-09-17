part of 'theme_provider.dart';

@freezed
class ThemeProviderEvent with _$ThemeProviderEvent {
  const factory ThemeProviderEvent.toggleTheme() = ToggleTheme;
}
