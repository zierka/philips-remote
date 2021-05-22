import 'package:flutter/widgets.dart' hide ErrorWidget;
import 'package:phimote/widgets/widget_state_builder/widget_load_state.dart';

import 'empty_state_widget.dart';
import 'error_state_widget.dart';
import 'loading_state_widget.dart';

const _fadeDuration = Duration(milliseconds: 150);
const _loadingDelay = Duration(milliseconds: 150);

class _Keys {
  _Keys._();

  static const prefix = "com.mayv.widget_state_builder.";

  static const loading = prefix + "loading";
  static const error = prefix + "error";
  static const content = prefix + "content";
  static const empty = prefix + "empty";
}

class WidgetStateBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Stream<WidgetLoadState> stream;
  final VoidCallback? onRetry;
  final Color? loadingBackgroundColor;

  /// pass empty state data here or in [WidgetLoadState.empty(data)]
  final EmptyStateData? emptyStateData;

  const WidgetStateBuilder({
    Key? key,
    required this.stream,
    required this.builder,
    this.loadingWidget,
    this.errorWidget,
    this.loadingBackgroundColor,
    this.onRetry,
    this.emptyStateData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WidgetLoadState>(
      initialData: WidgetLoadState.loading(),
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<WidgetLoadState> snapshot) {
        return AnimatedSwitcher(
          duration: _fadeDuration,
          child: _builder(context, snapshot),
        );
      },
    );
  }

  Widget _builder(
      BuildContext context, AsyncSnapshot<WidgetLoadState> snapshot) {
    if (snapshot.hasError) {
      final error = ScreenError(message: snapshot.error.toString());
      return widgetForState(WidgetLoadState.error(error), context);
    } else {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
          return widgetForState(WidgetLoadState.loading(), context);
        case ConnectionState.active:
          return widgetForState(
              snapshot.data ?? WidgetLoadState.loading(), context);
        case ConnectionState.done:
          // ¯\_(ツ)_/¯
          break;
      }

      return Placeholder();
    }
  }

  Widget widgetForState(WidgetLoadState state, BuildContext context) {
    return state.when(
      content: () {
        return buildContentWidget(builder, context);
      },
      contentKeepLoading: (until) {
        final _content = buildContentWidget(builder, context);

        return buildContentKeepLoadingWidget(until, _content);
      },
      loading: () {
        return buildDelayedLoadingWidget();
      },
      error: (error) {
        return buildErrorWidget(error);
      },
      empty: (data) {
        return buildEmptyWidget(data);
      },
    );
  }

  Widget buildContentWidget(
      Function(BuildContext) builder, BuildContext context) {
    return Container(
      key: ValueKey<String>(_Keys.content),
      child: builder(context),
    );
  }

  Widget buildContentKeepLoadingWidget(Future until, Widget _content) {
    return FutureBuilder(
      future: until,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: _fadeDuration,
          child: (snapshot.connectionState == ConnectionState.waiting)
              ? Stack(
                  children: [
                    _content,
                    buildLoadingWidget(),
                  ],
                )
              : _content,
        );
      },
    );
  }

  Widget buildLoadingWidget() {
    return Container(
      key: ValueKey<String>(_Keys.loading),
      child: loadingWidget ??
          LoadingStateWidget(
            backgroundColor: loadingBackgroundColor,
          ),
    );
  }

  Widget buildDelayedLoadingWidget() {
    return FutureBuilder(
      future: Future.delayed(_loadingDelay),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: _loadingDelay,
          child: (snapshot.connectionState == ConnectionState.waiting)
              ? Container()
              : buildLoadingWidget(),
        );
      },
    );
  }

  Widget buildErrorWidget(ScreenError error) {
    return Container(
      key: ValueKey<String>(_Keys.error),
      child: errorWidget ??
          ErrorStateWidget(
            error: error,
            onPressed: onRetry ?? () {},
          ),
    );
  }

  Widget buildEmptyWidget(EmptyStateData? data) {
    return Container(
      key: ValueKey<String>(_Keys.empty),
      child: EmptyStateWidget(
        data: data ??
            EmptyStateData(
              title: "Empty",
              text: "Nothing to see here, carry on.",
            ),
      ),
    );
  }
}
