// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppLayoutPage(),
      );
    },
    QuranHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuranHomePage(),
      );
    },
    QuranLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuranLayoutPage(),
      );
    },
    QuranSuraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuranSuraPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AppLayoutPage]
class AppLayoutRoute extends PageRouteInfo<void> {
  const AppLayoutRoute({List<PageRouteInfo>? children})
      : super(
          AppLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuranHomePage]
class QuranHomeRoute extends PageRouteInfo<void> {
  const QuranHomeRoute({List<PageRouteInfo>? children})
      : super(
          QuranHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuranLayoutPage]
class QuranLayoutRoute extends PageRouteInfo<void> {
  const QuranLayoutRoute({List<PageRouteInfo>? children})
      : super(
          QuranLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuranSuraPage]
class QuranSuraRoute extends PageRouteInfo<void> {
  const QuranSuraRoute({List<PageRouteInfo>? children})
      : super(
          QuranSuraRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuranSuraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
