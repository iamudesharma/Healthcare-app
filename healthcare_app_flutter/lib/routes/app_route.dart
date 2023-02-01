// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app_flutter/main.dart';

// part 'package:healthcare_app_flutter/routes/app_route.gr.dart';
part 'app_route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SetupPage),
    AutoRoute(
      page: SignInPage,
    )
  ],
)
// class $AppRouter {}

class AppRouter extends _$AppRouter {}
