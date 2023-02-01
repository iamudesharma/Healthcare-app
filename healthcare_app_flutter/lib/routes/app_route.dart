// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app_flutter/main.dart';
import 'package:healthcare_app_flutter/routes/route_guard.dart';

// part 'package:healthcare_app_flutter/routes/app_route.gr.dart';
part 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, guards: [AuthGuard]),
    AutoRoute(page: SetupPage),
    AutoRoute(
      page: SignInPage,
    )
  ],
)
// class $AppRouter {}

class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
