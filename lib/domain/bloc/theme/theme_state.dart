part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(false) bool isDark,
  }) = _ThemeState;
}
