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
      final args = routeData.argsAs<AddPatientRouteArgs>(
          orElse: () => const AddPatientRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AddPatientPage(
          key: args.key,
          isEdit: args.isEdit,
        ),
      );
    },
    AddMedicalStoreRoute.name: (routeData) {
      final args = routeData.argsAs<AddMedicalStoreRouteArgs>(
          orElse: () => const AddMedicalStoreRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AddMedicalStorePage(
          key: args.key,
          isEdit: args.isEdit,
        ),
      );
    },
    PatientHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PatientHomePage(),
      );
    },
    MedicalHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MedicalHomePage(),
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
        RouteConfig(
          MedicalHomeRoute.name,
          path: '/medical-home-page',
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
class AddPatientRoute extends PageRouteInfo<AddPatientRouteArgs> {
  AddPatientRoute({
    Key? key,
    bool? isEdit = false,
  }) : super(
          AddPatientRoute.name,
          path: '/add-patient-page',
          args: AddPatientRouteArgs(
            key: key,
            isEdit: isEdit,
          ),
        );

  static const String name = 'AddPatientRoute';
}

class AddPatientRouteArgs {
  const AddPatientRouteArgs({
    this.key,
    this.isEdit = false,
  });

  final Key? key;

  final bool? isEdit;

  @override
  String toString() {
    return 'AddPatientRouteArgs{key: $key, isEdit: $isEdit}';
  }
}

/// generated route for
/// [AddMedicalStorePage]
class AddMedicalStoreRoute extends PageRouteInfo<AddMedicalStoreRouteArgs> {
  AddMedicalStoreRoute({
    Key? key,
    bool? isEdit = false,
  }) : super(
          AddMedicalStoreRoute.name,
          path: '/add-medical-store-page',
          args: AddMedicalStoreRouteArgs(
            key: key,
            isEdit: isEdit,
          ),
        );

  static const String name = 'AddMedicalStoreRoute';
}

class AddMedicalStoreRouteArgs {
  const AddMedicalStoreRouteArgs({
    this.key,
    this.isEdit = false,
  });

  final Key? key;

  final bool? isEdit;

  @override
  String toString() {
    return 'AddMedicalStoreRouteArgs{key: $key, isEdit: $isEdit}';
  }
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

/// generated route for
/// [MedicalHomePage]
class MedicalHomeRoute extends PageRouteInfo<void> {
  const MedicalHomeRoute()
      : super(
          MedicalHomeRoute.name,
          path: '/medical-home-page',
        );

  static const String name = 'MedicalHomeRoute';
}
