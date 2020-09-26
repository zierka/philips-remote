import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phimote/logic/services/api.dart';

part 'widget_load_state.freezed.dart';

@freezed
abstract class WidgetLoadState with _$WidgetLoadState {
  const factory WidgetLoadState.content() = Content;
  const factory WidgetLoadState.contentKeepLoading(Future until) =
      ContentKeepLoading;
  const factory WidgetLoadState.loading() = Loading;
  const factory WidgetLoadState.error(ScreenError error) = Error;

  /// Pass data here or specify it on [WidgetStateBuilder]
  const factory WidgetLoadState.empty([EmptyStateData data]) = Empty;
}

class ScreenError {
  String message;

  ScreenError({
    @required this.message,
  });

  ScreenError.apiException(
    ApiException exception,
  ) {
    message = exception.message;
  }
}

class EmptyStateData {
  String title, text;

  EmptyStateData({@required this.title, @required this.text});
}
