import 'package:auto_route/auto_route.dart';
import 'package:healthcare_app_flutter/main.dart';

import 'app_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print('AuthGuard: ${sessionManager.signedInUser?.email}');

    if (sessionManager.signedInUser == null) {
      router.push(const SetupRoute());
      resolver.next(false);
    } else {
      resolver.next(false);
      router.push(const SignInRoute());
    }
  }
}
