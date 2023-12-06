import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quran/controllers/locale_controller.dart';
import 'package:quran/controllers/theme_controller.dart';
import 'package:quran/main_providers.dart';
import 'package:quran/routes/app_router.dart';
import 'package:quran/routes/my_route_observer.dart';
import 'package:quran/utilities/custom_theme.dart';
import 'package:quran/utilities/hive_db.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  Provider.debugCheckInvalidValueType = null;

  // first initialize hive db
  await HiveDB().initialize();

  // run app and create multi providers
  runApp(const MainProviders(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final appRouter = AppRouter();



  _currentRoute(){
    return const AppLayoutRoute();
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeController, LocaleController>(
      builder: (context, themeController, localeController, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeController.getLocale,
          theme: CustomTheme().light(fontFamily: localeController.getFontFamily),
          darkTheme: CustomTheme().dark(fontFamily: localeController.getFontFamily),
          themeMode: ThemeMode.values[themeController.getThemeModeIndex],
          //themeMode: ThemeMode.light,
          routerDelegate: AutoRouterDelegate.declarative(
              appRouter,
              navigatorObservers: () => [MyRouteObserver()],
              routes: (_) => [
                _currentRoute()
              ]

          ),
          routeInformationParser: appRouter.defaultRouteParser(
              includePrefixMatches: true
          ),
        );
      }
    );
  }
}
