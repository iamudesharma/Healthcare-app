/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:healthcare_app_client/src/protocol/doctor.dart' as _i3;
import 'package:healthcare_app_client/src/protocol/medicine.dart' as _i4;
import 'package:healthcare_app_client/src/protocol/patient.dart' as _i5;
import 'package:serverpod_auth_client/module.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

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

class _EndpointMedicine extends _i1.EndpointRef {
  _EndpointMedicine(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'medicine';

  _i2.Future<String?> addMedicine(_i4.Medicine medicine) =>
      caller.callServerEndpoint<String?>(
        'medicine',
        'addMedicine',
        {'medicine': medicine},
      );

  _i2.Future<List<_i4.Medicine?>> getMedicines() =>
      caller.callServerEndpoint<List<_i4.Medicine?>>(
        'medicine',
        'getMedicines',
        {},
      );
}

class _EndpointPatient extends _i1.EndpointRef {
  _EndpointPatient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'patient';

  _i2.Future<void> cratePatient(_i5.Patient patient) =>
      caller.callServerEndpoint<void>(
        'patient',
        'cratePatient',
        {'patient': patient},
      );

  _i2.Future<_i5.Patient?> currentPatient() =>
      caller.callServerEndpoint<_i5.Patient?>(
        'patient',
        'currentPatient',
        {},
      );

  _i2.Future<List<_i5.Patient>> getPatient() =>
      caller.callServerEndpoint<List<_i5.Patient>>(
        'patient',
        'getPatient',
        {},
      );

  _i2.Future<bool> updatePatient(_i5.Patient patient) =>
      caller.callServerEndpoint<bool>(
        'patient',
        'updatePatient',
        {'patient': patient},
      );

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'patient',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'patient',
        'verifyUpload',
        {'path': path},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    doctor = _EndpointDoctor(this);
    medicine = _EndpointMedicine(this);
    patient = _EndpointPatient(this);
    modules = _Modules(this);
  }

  late final _EndpointDoctor doctor;

  late final _EndpointMedicine medicine;

  late final _EndpointPatient patient;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'doctor': doctor,
        'medicine': medicine,
        'patient': patient,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
