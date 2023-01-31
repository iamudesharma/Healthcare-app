/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/patient_endpoint.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'patient': _i2.PatientEndpoint()
        ..initialize(
          server,
          'patient',
          null,
        )
    };
    connectors['patient'] = _i1.EndpointConnector(
      name: 'patient',
      endpoint: endpoints['patient']!,
      methodConnectors: {
        'cratePatient': _i1.MethodConnector(
          name: 'cratePatient',
          params: {
            'patient': _i1.ParameterDescription(
              name: 'patient',
              type: _i1.getType<dynamic>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i2.PatientEndpoint).cratePatient(
            session,
            params['patient'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i3.Endpoints()..initializeEndpoints(server);
  }
}
