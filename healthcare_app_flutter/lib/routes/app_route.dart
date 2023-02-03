// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:healthcare_app_flutter/features/doctor/doctor.dart';
import 'package:healthcare_app_flutter/main.dart';
import 'package:healthcare_app_flutter/routes/route_guard.dart';

import '../features/features.dart';
import '../features/patient/pages/patient_home_page.dart';

// part 'package:healthcare_app_flutter/routes/app_route.gr.dart';
part 'app_route.gr.dart';

final appRouteProvider = Provider<AppRouter>((ref) {
  return AppRouter(authGuard: AuthGuard(ref));
});

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, guards: [AuthGuard]),
    AutoRoute(page: SetupPage),
    AutoRoute(
      page: SignInPage,
    ),
    AutoRoute(page: AddDoctorPage),
    AutoRoute(page: AddPatientPage),
    AutoRoute(
      page: AddMedicalStorePage,
    ),
    AutoRoute(
      page: PatientHomePage,
    ),
  ],
)
// class $AppRouter {}

class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
