import 'package:auto_route/auto_route.dart';

import 'package:insight/commons/widgets/firebase_init.dart';
import 'package:insight/features/auth/interface/widgets/auth_checker.dart';
import 'package:insight/features/homepage/interface/home_page.dart';

part 'router_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(page: AuthCheckerRoute.page),
        AutoRoute(page: FirebaseInitRoute.page, initial: true)
      ];
}
