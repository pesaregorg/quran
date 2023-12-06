import 'package:flutter/material.dart';
import 'package:quran/utilities/custom_error.dart';

class ParseRequestErrorMessage extends StatelessWidget {
  final CustomError? error;
  final Color? color;
  final double? fontSize;
  const ParseRequestErrorMessage({
    required this.error,
    this.color,
    this.fontSize,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(error != null){
      if(error!.message != null){
        return Text(error!.message!, style: TextStyle(color: color ?? Colors.red, fontSize: fontSize),);
      }
    }
    return const SizedBox.shrink();
  }
}
