import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quran/controllers/quran/quran_read_controller.dart';
import 'package:quran/controllers/quran/quran_sura_controller.dart';
import 'package:quran/models/quran_sura.dart';
import 'package:quran/routes/app_router.dart';
import 'package:quran/utilities/helpers.dart';
import 'package:quran/utilities/string_extentions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuranSuraList extends StatelessWidget {
  const QuranSuraList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<QuranSuraController, QuranReadController>(
      builder: (context, quranSuraController, quranReadController, child) {
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: quranSuraController.getSuras.length,
            itemBuilder: (context, index){

              QuranSura sura = quranSuraController.getSuras[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: (){
                    quranReadController.setNewAyasFromSuraClick(sura.id);
                    context.navigateTo(const QuranSuraRoute());
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0
                    ),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        color: Helpers.isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade100
                    ),
                    child: Row(
                      children: [
                        Text(sura.id.toString().toShow(context), style: TextStyle(
                            color: Helpers.isDarkMode(context) ? Colors.green : Colors.green.shade800
                        ),),
                        Expanded(
                          child: Image.asset("assets/quran_surah_names/quran_surah_names_${sura.id}.png",
                            colorBlendMode: BlendMode.srcIn,
                            color: Helpers.isDarkMode(context) ? Colors.green : Colors.green.shade800,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(sura.name),
                              Text(sura.englishName),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(sura.verseCount.toString().toShow(context)),
                              const SizedBox(width: 4.0,),
                              Text(AppLocalizations.of(context)!.verse),

                            ],
                          ),
                        ),
                        Text(sura.reval.toString().toShow(context))
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      }
    );
  }
}
