import 'package:flutter/material.dart';


const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];


extension NumberParsing on String {




  String toShow(BuildContext context) {

    final locale = Localizations.localeOf(context);

    String input = this;
    if(locale == const Locale("ar")){
      for (int i = 0; i < farsi.length; i++) {
        input = input.replaceAll(farsi[i], arabic[i])
            .replaceAll(english[i], arabic[i]);
      }


      return input;
    }


    if(locale == const Locale("fa")){
      for (int i = 0; i < arabic.length; i++) {
        input = input.replaceAll(arabic[i], farsi[i])
            .replaceAll(english[i], farsi[i]);
      }

      return input;
    }


    return input;
  }





  String toEnglish() {

    String input = this;
    for (int i = 0; i < farsi.length; i++) {
      input = input.replaceAll(farsi[i], english[i]);
    }
    for (int i = 0; i < arabic.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }

    return input;
  }





  String normalizeArabic() {

    String input = this;

    StringBuffer result = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      result.write(normalizeArabicChar(input[i]));
    }
    return result.toString();
  }





}





String normalizeArabicChar(String char) {
  switch (char) {
    case 'أ':
    case 'إ':
    case 'آ':
      return 'ا';
    case 'ؤ':
    case 'ئ':
      return 'ی';
    case 'ى':
      return 'ی';
    case 'ة':
      return 'ه';
    case 'ً':
    case 'ٌ':
    case 'ٍ':
    case 'َ':
    case 'ُ':
    case 'ِ':
    case 'ّ':
      return '';
    case 'َا':
    case 'َل':
    case 'َلٰه':
    case 'َح':
    case 'َم':
    case 'َن':
      return char.substring(1);
    default:
      return char;
  }
}