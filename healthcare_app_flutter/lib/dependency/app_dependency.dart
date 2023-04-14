import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:healthcare_app_flutter/main.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../routes/app_route.dart';

class AppDependency {
  static Provider<AppRouter> routeProvider = appRouteProvider;
  static Provider<Client> clientProvider = _clientProvider;
  static Provider<SessionManager> sessionManagerProvider =
      _sessionManagerProvider;
}

final _clientProvider = Provider<Client>((ref) {
  return client;
});

final _sessionManagerProvider = Provider<SessionManager>((ref) {
  return sessionManager;
});
