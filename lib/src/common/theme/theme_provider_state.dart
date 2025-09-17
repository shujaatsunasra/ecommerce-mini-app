part of 'theme_provider.dart';

@freezed
class ThemeProviderState with _$ThemeProviderState {
  const factory ThemeProviderState.light() = _Light;
  const factory ThemeProviderState.dark() = _Dark;
}
