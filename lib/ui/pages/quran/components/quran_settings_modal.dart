import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/controllers/locale_controller.dart';
import 'package:quran/controllers/quran/quran_settings_controller.dart';
import 'package:quran/ui/widgets/bordered_button.dart';
import 'package:quran/utilities/string_extentions.dart';
import 'package:provider/provider.dart';


class QuranSettingsModal extends StatelessWidget {
  const QuranSettingsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<QuranSettingsController, LocaleController>(
      builder: (context, quranSettingsController, localeController,  child) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                title: Text(AppLocalizations.of(context)!.settings),
              ),

              ListTile(
                title: Text(AppLocalizations.of(context)!.appLanguage),
                subtitle: Wrap(
                  children: localeController.getCountries.map((country){
                    return InkWell(
                      onTap: (){
                        localeController.changeLocale(country["locale"]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: localeController.getLocale == country["locale"] ?
                          Theme.of(context).primaryColor.withAlpha(150) : Theme.of(context).primaryColor.withAlpha(30),
                          borderRadius: const BorderRadius.all(Radius.circular(5.0))
                        ),
                        child: Text(country["title"], style: TextStyle(
                          color: localeController.getLocale == country["locale"] ? Colors.white : null
                        ),),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const Divider(height: 1,),


              ListTile(
                onTap: (){
                  quranSettingsController.toggleShowTranslation();
                },
                title: Text(AppLocalizations.of(context)!.showTranslation),
                trailing: Switch(
                  value: quranSettingsController.getShowTranslation,
                  onChanged: (value){
                    quranSettingsController.toggleShowTranslation();
                  },
                ),
              ),


              const Divider(height: 1,),
              ListTile(
                title: Text(AppLocalizations.of(context)!.fontSize),
                subtitle: Text("بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ", style: TextStyle(
                  fontSize: quranSettingsController.getFontSize,
                  fontFamily: "AlQuranAlKareem"
                ),),
                trailing: SizedBox(
                  height: 40,
                  width: 120,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: BorderedButton(
                            onTap: (){
                              quranSettingsController.plusFontSize();
                            },
                            child: const Center(child: Icon(Icons.add, size: 20,))
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(quranSettingsController.getFontSize.toInt().toString().toShow(context),
                                style: const TextStyle(fontSize: 14.0),)
                          )
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: BorderedButton(
                            onTap: (){
                              quranSettingsController.minusFontSize();
                            },
                            child: const Center(child: Icon(Icons.remove, size: 20,))
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
