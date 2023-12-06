import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double? value;
  final Color? color;
  const LoadingIndicator({
    this.value,
    this.color,
    Key? key}) : super(key: key);

  /// Returns the appropriate "loading indicator" icon for the given `platform`.
  Widget _getIndicatorWidget(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoActivityIndicator(color: color,);
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      default:
        return CircularProgressIndicator(value: value, color: color,);
    }
  }

  @override
  Widget build(BuildContext context) =>
      _getIndicatorWidget(Theme.of(context).platform);
}