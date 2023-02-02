import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_flutter/main.dart';

import 'app_route.dart';

class AuthGuard extends AutoRouteGuard  {

  final Ref ref;

  AuthGuard(this.ref);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    await sessionManager.initialize();

    print('AuthGuard: ${await sessionManager.isSignedIn}');

    if (sessionManager.isSignedIn) {
      print('AuthGuard: Signed in ${sessionManager.isSignedIn}}');
      // router.push(const SetupRoute());
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(const SignInRoute());
    }
  }
}
// String? String? getData (){
//   return ('','');
// }




