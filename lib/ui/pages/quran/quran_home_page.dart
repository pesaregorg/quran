import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran/controllers/quran/quran_sura_controller.dart';
import 'package:quran/routes/app_router.dart';
import 'package:quran/ui/pages/quran/components/quran_juzs_list.dart';
import 'package:quran/ui/pages/quran/components/quran_settings_modal.dart';
import 'package:quran/ui/pages/quran/components/quran_sura_list.dart';
import 'package:quran/ui/pages/quran/components/quran_sura_search_box.dart';
import 'package:quran/utilities/helpers.dart';
import 'package:provider/provider.dart';


@RoutePage()
class QuranHomePage extends StatefulWidget {
  const QuranHomePage({Key? key}) : super(key: key);

  @override
  State<QuranHomePage> createState() => _QuranHomePageState();
}

class _QuranHomePageState extends State<QuranHomePage> {
  @override
  Widget build(BuildContext context) {


    return Consumer<QuranSuraController>(
        builder: (context, quranSuraController, child) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(

                actions: [
                  IconButton(
                      onPressed: (){
                        Helpers.openModal(context: context, child: const QuranSettingsModal());
                      },
                      tooltip: AppLocalizations.of(context)!.settings,
                      icon: const Icon(Icons.settings_rounded)
                  )
                ],

                title: Text(AppLocalizations.of(context)!.theHolyQuran,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: AppLocalizations.of(context)!.suras,
                    ),
                    Tab(
                      text: AppLocalizations.of(context)!.juzs,
                    )
                  ],
                ),
              ),

              body: TabBarView(
                children: [


                  // tab 1 suras
                  NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        const SliverAppBar(
                          automaticallyImplyLeading: false,
                          flexibleSpace: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 8.0
                            ),
                            child: QuranSuraSearchBox(),
                          ),
                        ),



                      ];
                    },
                    body: const QuranSuraList(),
                  ),


                  // tab 2 juzs
                  const QuranJuzList()
                ],
              ),
            ),
          );
        }
    );
  }
}
