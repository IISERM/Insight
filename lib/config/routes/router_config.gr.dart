// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router_config.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthCheckerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthChecker(),
      );
    },
    FirebaseInitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FirebaseInit(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [AuthChecker]
class AuthCheckerRoute extends PageRouteInfo<void> {
  const AuthCheckerRoute({List<PageRouteInfo>? children})
      : super(
          AuthCheckerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthCheckerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FirebaseInit]
class FirebaseInitRoute extends PageRouteInfo<void> {
  const FirebaseInitRoute({List<PageRouteInfo>? children})
      : super(
          FirebaseInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirebaseInitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
