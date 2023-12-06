
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quran/controllers/quran/quran_settings_controller.dart';
import 'package:quran/controllers/quran/quran_player_ontroller.dart';
import 'package:quran/controllers/quran/quran_read_controller.dart';
import 'package:quran/models/quran_sura.dart';
import 'package:quran/utilities/helpers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


@RoutePage()
class QuranSuraPage extends StatefulWidget {
  const QuranSuraPage({Key? key}) : super(key: key);

  @override
  State<QuranSuraPage> createState() => _QuranSuraPageState();
}

class _QuranSuraPageState extends State<QuranSuraPage> {





  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

    return Consumer2<QuranReadController, QuranSettingsController>(
      builder: (context, quranReadController, quranSettingsController, child) {
        return ChangeNotifierProvider<QuranPlayerController>(
          create: (_) => QuranPlayerController(quranReadController.getAyas),
          child: Consumer<QuranPlayerController>(
            builder: (context, quranPlayerController, child) {
              return Scaffold(
                primary: true,
                backgroundColor: Helpers.isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade100,
                appBar: AppBar(
                  title: Builder(builder: (context){
                    if(quranReadController.getSuras.length == 1){
                      return Text("${quranReadController.getSuras.first.name} ${AppLocalizations.of(context)!.verse} ${quranReadController.getSuras.first.playList?.first.verse} - ${quranReadController.getSuras.first.playList?.last.verse}");
                    }
                    if(quranReadController.getSuras.length > 1){
                      return Text("${quranReadController.getSuras.first.name} ${AppLocalizations.of(context)!.verse} ${quranReadController.getSuras.first.playList?.first.verse} - ${quranReadController.getSuras.last.name} ${AppLocalizations.of(context)!.verse} ${quranReadController.getSuras.last.playList?.last.verse}");
                    }
                    return const Text("");
                  }),
                ),

                floatingActionButton: FloatingActionButton(
                  onPressed: (){

                    if(quranPlayerController.getPlayerState == PlayerState.stopped){
                      quranPlayerController.startPlayer();
                    }
                    if(quranPlayerController.getPlayerState == PlayerState.playing){
                      quranPlayerController.getAudioPlayer.pause();
                    }
                    if(quranPlayerController.getPlayerState == PlayerState.paused){
                      quranPlayerController.getAudioPlayer.resume();
                    }


                  },
                  child: Icon(quranPlayerController.getPlayerState == PlayerState.playing ? Icons.pause_circle : Icons.play_circle),
                ),
                body: ListView.builder(
                  itemCount: quranReadController.getSuras.length,
                    itemBuilder: (context, index){
                    QuranSura sura = quranReadController.getSuras[index];
                      return Column(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Image.asset("assets/quran_surah_names/quran_surah_names_${sura.id}.png",
                              colorBlendMode: BlendMode.srcIn,
                              color: Helpers.isDarkMode(context) ? Colors.green : Colors.green.shade800,
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: sura.playList?.map((aya) {
                              return Container(
                                key: quranPlayerController.getItemKey(aya.id),
                                decoration: BoxDecoration(
                                  color: quranReadController.isPlayThisAya(aya.id, quranPlayerController.getSelectedPlayerIdx -1) &&
                                      quranPlayerController.getPlayerState == PlayerState.playing ? (Helpers.isDarkMode(context) ? Colors.black.withAlpha(100) : Colors.green.shade100 ) :
                                  Helpers.isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade100,
                                  border: Border(
                                      top: BorderSide(
                                          width: index == 0 ? 1 : 0,
                                          color: Helpers.isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade300
                                      ),
                                    bottom: BorderSide(
                                      color: Helpers.isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade300,
                                      width: 4.0
                                    )
                                  )
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Image.asset("assets/images/quran-border-circle-verse.png",
                                              fit: BoxFit.cover,),
                                            ),
                                            Center(child: Text(aya.verse.toString(), style: const TextStyle(
                                              fontSize: 13.0
                                            ),))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border(

                                              left: BorderSide(
                                                  width: 1,
                                                  color: Helpers.isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade300
                                              ),
                                                right: BorderSide(
                                                    width: 1,
                                                    color: Helpers.isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade300
                                                )
                                            )
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text(aya.text, style: TextStyle(
                                                  fontSize: quranSettingsController.getFontSize,
                                                  fontFamily: "AlQuranAlKareem"
                                                ),
                                                textDirection: TextDirection.rtl,
                                                ),
                                              ),
                                              const SizedBox(height: 8.0,),
                                              Builder(
                                                builder: (context) {

                                                  if(quranSettingsController.getShowTranslation){

                                                    if(locale == const Locale("fa")){
                                                      return Text(quranReadController.findFaTranslate(aya.id),
                                                      style: const TextStyle(
                                                        fontFamily: "Yekan"
                                                      ),);
                                                    }
                                                    return Text(quranReadController.findEnTranslate(aya.id),
                                                      style: const TextStyle(
                                                        fontFamily: "Poppins"
                                                    ),);
                                                  }

                                                  return const SizedBox.shrink();

                                                }
                                              ),
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              );

                            }).toList() ?? [],
                          )
                        ],
                      );
                    }
                ),
              );
            }
          ),
        );
      }
    );
  }
}