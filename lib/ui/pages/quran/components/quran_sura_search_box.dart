import 'package:flutter/material.dart';
import 'package:quran/controllers/quran/quran_sura_controller.dart';
import 'package:quran/utilities/helpers.dart';
import 'package:quran/utilities/input_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuranSuraSearchBox extends StatelessWidget {
  const QuranSuraSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuranSuraController>(
      builder: (context, quranSuraController, child) {
        return SizedBox(
          width: double.infinity,
          height: 50.0,
          child: TextField(
            onChanged: (value) => quranSuraController.search(value),
            decoration: InputTheme(Helpers.isDarkMode(context)).searchDecoration.copyWith(
                hintText: AppLocalizations.of(context)!.search
            ),
          ),
        );
      }
    );
  }
}
