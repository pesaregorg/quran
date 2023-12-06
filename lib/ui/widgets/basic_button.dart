import 'package:flutter/material.dart';
import 'package:quran/utilities/custom_theme.dart';

class BasicButton extends StatelessWidget {

  final Function? onTap;
  final Widget child;
  final Color? color;
  final bool? disabled;
  final BorderRadius? borderRadius;

  const BasicButton({
    required this.child,
    this.color,
    required this.onTap,
    this.disabled,
    this.borderRadius,

    Key? key}) : super(key: key);




  Color _parseColor(){
    if(disabled == true){
      return CustomTheme().themeColor;
    }

    if(color != null){
      return color!;
    }

    return CustomTheme().themeColor;
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10.0)),
      onTap: disabled == true || onTap == null ? null : () => onTap!(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10.0)),
          color: _parseColor()
        ),
        child: child,
      ),
    );
  }
}
