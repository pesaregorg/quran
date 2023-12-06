import 'package:flutter/material.dart';
import 'package:quran/utilities/custom_theme.dart';

class InputTheme {
  InputTheme(this.isDarkMode);

  bool isDarkMode;

  InputDecoration get outlineBorder{
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: isDarkMode ? Colors.white : Colors.black,
      hintStyle: TextStyle(
          color: isDarkMode ? Colors.white.withAlpha(100) : Colors.black.withAlpha(100)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 0.5,
            color: isDarkMode ? Colors.white.withAlpha(50) : Colors.black.withAlpha(50)
        ), //<-- SEE HERE
      ),
      prefixIconColor: isDarkMode ? Colors.white.withAlpha(50) : Colors.black.withAlpha(50),
      suffixIconColor: isDarkMode ? Colors.white.withAlpha(50) : Colors.black.withAlpha(50),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.0,
            color: CustomTheme().themeColor
        ), //<-- SEE HERE
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.0,
            color: Colors.red
        ), //<-- SEE HERE
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width:1.0,
            color: Colors.red.shade800
        ), //<-- SEE HERE
      ),
    );

}





  InputDecoration get searchDecoration{
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: isDarkMode ? Colors.white.withAlpha(30) : Colors.black.withAlpha(30),
      hintStyle: TextStyle(
          color: isDarkMode ? Colors.white.withAlpha(100) : Colors.black.withAlpha(100)
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: isDarkMode ? Colors.white.withAlpha(50) : Colors.black.withAlpha(50),
      suffixIconColor: isDarkMode ? Colors.white.withAlpha(50) : Colors.black.withAlpha(50),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none,
      ),
      errorBorder:const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none,
      ),
    );

  }


}