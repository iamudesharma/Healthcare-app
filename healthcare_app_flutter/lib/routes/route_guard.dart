import 'package:auto_route/auto_route.dart';
import 'package:healthcare_app_flutter/main.dart';

import 'app_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print('AuthGuard: ${sessionManager.signedInUser?.email}');

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




