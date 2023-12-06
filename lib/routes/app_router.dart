import 'package:auto_route/auto_route.dart';
import 'package:quran/ui/layouts/app_page_layout.dart';
import 'package:quran/ui/layouts/quran_page_layout.dart';
import 'package:quran/ui/pages/quran/quran_home_page.dart';
import 'package:quran/ui/pages/quran/quran_sura_page.dart';
import 'package:quran/ui/pages/splash/splash_page.dart';



part 'app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {


  @override
  List<AutoRoute> get routes => [


    AutoRoute(
      path: "/splash",
      page: SplashRoute.page,
    ),

    AutoRoute(
      path: "/app",
      page: AppLayoutRoute.page,
      children: [
        AutoRoute(
            path: "",
            page: QuranLayoutRoute.page,
            children: [
              AutoRoute(
                path: "",
                page: QuranHomeRoute.page,
              ),
              AutoRoute(
                path: "sura",
                page: QuranSuraRoute.page,
              ),
            ]
        ),
      ]
    ),



  ];
}

