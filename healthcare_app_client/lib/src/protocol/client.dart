/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:healthcare_app_client/src/protocol/doctor.dart' as _i3;
import 'package:healthcare_app_client/src/protocol/patient.dart' as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

class _EndpointDoctor extends _i1.EndpointRef {
  _EndpointDoctor(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'doctor';

  _i2.Future<void> addDoctor(_i3.Doctor doctor) =>
      caller.callServerEndpoint<void>(
        'doctor',
        'addDoctor',
        {'doctor': doctor},
      );

  _i2.Future<_i3.Doctor?> currentDoctor() =>
      caller.callServerEndpoint<_i3.Doctor?>(
        'doctor',
        'currentDoctor',
        {},
      );

  _i2.Future<List<_i3.Doctor>> getDoctor(String name) =>
      caller.callServerEndpoint<List<_i3.Doctor>>(
        'doctor',
        'getDoctor',
        {'name': name},
      );

  _i2.Future<List<_i3.Doctor>> getDoctorByAge(int age) =>
      caller.callServerEndpoint<List<_i3.Doctor>>(
        'doctor',
        'getDoctorByAge',
        {'age': age},
      );

  _i2.Future<List<_i3.Doctor>> getDoctorByAgeAndName(
    int age,
    String name,
  ) =>
      caller.callServerEndpoint<List<_i3.Doctor>>(
        'doctor',
        'getDoctorByAgeAndName',
        {
          'age': age,
          'name': name,
        },
      );

  _i2.Future<void> updateDoctor(_i3.Doctor doctor) =>
      caller.callServerEndpoint<void>(
        'doctor',
        'updateDoctor',
        {'doctor': doctor},
      );
}

class _EndpointPatient extends _i1.EndpointRef {
  _EndpointPatient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'patient';

  _i2.Future<void> cratePatient(_i4.Patient patient) =>
      caller.callServerEndpoint<void>(
        'patient',
        'cratePatient',
        {'patient': patient},
      );

  _i2.Future<_i4.Patient?> currentPatient() =>
      caller.callServerEndpoint<_i4.Patient?>(
        'patient',
        'currentPatient',
        {},
      );

  _i2.Future<List<_i4.Patient>> getPatient() =>
      caller.callServerEndpoint<List<_i4.Patient>>(
        'patient',
        'getPatient',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    doctor = _EndpointDoctor(this);
    patient = _EndpointPatient(this);
    modules = _Modules(this);
  }

  late final _EndpointDoctor doctor;

  late final _EndpointPatient patient;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'doctor': doctor,
        'patient': patient,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
