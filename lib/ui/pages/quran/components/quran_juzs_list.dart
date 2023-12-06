import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/controllers/quran/quran_juz_controller.dart';
import 'package:quran/controllers/quran/quran_read_controller.dart';
import 'package:quran/models/quran_juz.dart';
import 'package:quran/routes/app_router.dart';
import 'package:quran/utilities/helpers.dart';
import 'package:provider/provider.dart';


class QuranJuzList extends StatelessWidget {
  const QuranJuzList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuranJuzController>(
      create: (_) => QuranJuzController(),
      child: Consumer2<QuranJuzController, QuranReadController>(
        builder: (context, quranJuzController, quranReadController, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: quranJuzController.getJuzs.length,
              itemBuilder: (context, index){

              QuranJuz juz = quranJuzController.getJuzs[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: (){
                    quranReadController.setNewAyasFromJuzClick(juz.id);
                    context.navigateTo( const QuranSuraRoute());
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0
                    ),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        color: Helpers.isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade100
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text("${AppLocalizations.of(context)!.juz} ${juz.id}")
                        ),
                        Expanded(
                            child: Text(juz.firstSura)
                        ),
                        Expanded(
                            child: Text("${AppLocalizations.of(context)!.verse} ${juz.verseStart}")
                        ),

                        SizedBox(
                          width: 20,
                            child: Icon(Icons.arrow_forward_ios, size: 16,)
                        ),
                      ],
                    ),
                  ),
                ),
              );
              }
          );
        }
      ),
    );
  }
}
