import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_flutter/main.dart';

import '../dependency/app_dependency.dart';
import 'app_route.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    await sessionManager.initialize();

    print('AuthGuard: ${await sessionManager.isSignedIn}');

    if (sessionManager.isSignedIn) {
      print('AuthGuard: Signed in ${sessionManager.isSignedIn}}');
      // router.push(const SetupRoute());

      // await checkUser(sessionManager.signedInUser!.id!, ref);

      // if (await client.patient.currentPatient() == null) {
      // if (await client.doctor.currentDoctor() == null) {
      if (await client.chemists.currentChemists() == null) {
        router.push(const SetupRoute());
      } else {
        resolver.next(true);
      }
      // } else {
      //   resolver.next(true);
      // }
      // } else {
      //   resolver.next(true);
      // }
    } else {
      resolver.next(false);
      router.push(const SignInRoute());
    }
  }
}
// String? String? getData (){
//   return ('','');
// }




