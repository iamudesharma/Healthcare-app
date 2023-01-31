/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/patient_endpoint.dart' as _i2;
import 'package:healthcare_app_server/src/generated/patient.dart' as _i3;
import 'package:serverpod_auth_server/module.dart' as _i4;

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
              type: _i1.getType<_i3.Patient>(),
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
        ),
        'currentPatient': _i1.MethodConnector(
          name: 'currentPatient',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i2.PatientEndpoint)
                  .currentPatient(session),
        ),
        'getPatient': _i1.MethodConnector(
          name: 'getPatient',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i2.PatientEndpoint).getPatient(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
