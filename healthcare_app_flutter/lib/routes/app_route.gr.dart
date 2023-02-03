// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_route.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SetupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SetupPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    AddDoctorRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddDoctorPage(),
      );
    },
    AddPatientRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddPatientPage(),
      );
    },
    AddMedicalStoreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddMedicalStorePage(),
      );
    },
    PatientHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PatientHomePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authGuard],
        ),
        RouteConfig(
          SetupRoute.name,
          path: '/setup-page',
        ),
        RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        RouteConfig(
          AddDoctorRoute.name,
          path: '/add-doctor-page',
        ),
        RouteConfig(
          AddPatientRoute.name,
          path: '/add-patient-page',
        ),
        RouteConfig(
          AddMedicalStoreRoute.name,
          path: '/add-medical-store-page',
        ),
        RouteConfig(
          PatientHomeRoute.name,
          path: '/patient-home-page',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SetupPage]
class SetupRoute extends PageRouteInfo<void> {
  const SetupRoute()
      : super(
          SetupRoute.name,
          path: '/setup-page',
        );

  static const String name = 'SetupRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [AddDoctorPage]
class AddDoctorRoute extends PageRouteInfo<void> {
  const AddDoctorRoute()
      : super(
          AddDoctorRoute.name,
          path: '/add-doctor-page',
        );

  static const String name = 'AddDoctorRoute';
}

/// generated route for
/// [AddPatientPage]
class AddPatientRoute extends PageRouteInfo<void> {
  const AddPatientRoute()
      : super(
          AddPatientRoute.name,
          path: '/add-patient-page',
        );

  static const String name = 'AddPatientRoute';
}

/// generated route for
/// [AddMedicalStorePage]
class AddMedicalStoreRoute extends PageRouteInfo<void> {
  const AddMedicalStoreRoute()
      : super(
          AddMedicalStoreRoute.name,
          path: '/add-medical-store-page',
        );

  static const String name = 'AddMedicalStoreRoute';
}

/// generated route for
/// [PatientHomePage]
class PatientHomeRoute extends PageRouteInfo<void> {
  const PatientHomeRoute()
      : super(
          PatientHomeRoute.name,
          path: '/patient-home-page',
        );

  static const String name = 'PatientHomeRoute';
}
