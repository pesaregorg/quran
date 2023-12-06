import 'package:flutter/material.dart';
import 'package:quran/controllers/app_version_controller.dart';
import 'package:quran/controllers/locale_controller.dart';
import 'package:quran/controllers/quran/quran_settings_controller.dart';
import 'package:quran/controllers/quran/quran_read_controller.dart';
import 'package:quran/controllers/quran/quran_sura_controller.dart';
import 'package:quran/controllers/theme_controller.dart';
import 'package:provider/provider.dart';

class MainProviders extends StatefulWidget {
  final Widget child;
  const MainProviders({
    required this.child,
    Key? key}) : super(key: key);

  @override
  State<MainProviders> createState() => _MainProvidersState();
}

class _MainProvidersState extends State<MainProviders> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [

          ChangeNotifierProvider<LocaleController>(
              create: (_) => LocaleController()
          ),

          ChangeNotifierProvider<ThemeController>(
              create: (_) => ThemeController()
          ),

          ChangeNotifierProvider<AppVersionController>(
              create: (_) => AppVersionController()
          ),


          ChangeNotifierProvider<QuranSuraController>(
              create: (_) => QuranSuraController()
          ),

          ChangeNotifierProvider<QuranReadController>(
              create: (_) => QuranReadController()
          ),

          ChangeNotifierProvider<QuranSettingsController>(
              create: (_) => QuranSettingsController()
          ),

        ],
      child: widget.child,
    );
  }
}
