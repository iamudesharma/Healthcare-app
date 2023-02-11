/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:healthcare_app_client/src/protocol/chemists.dart' as _i3;
import 'package:healthcare_app_client/src/protocol/doctor.dart' as _i4;
import 'package:healthcare_app_client/src/protocol/medicine.dart' as _i5;
import 'package:healthcare_app_client/src/protocol/patient.dart' as _i6;
import 'dart:typed_data' as _i7;
import 'package:serverpod_auth_client/module.dart' as _i8;
import 'dart:io' as _i9;
import 'protocol.dart' as _i10;

class _EndpointChemists extends _i1.EndpointRef {
  _EndpointChemists(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chemists';

  _i2.Future<void> addChemists(_i3.Chemists chemists) =>
      caller.callServerEndpoint<void>(
        'chemists',
        'addChemists',
        {'chemists': chemists},
      );

  _i2.Future<_i3.Chemists?> currentChemists() =>
      caller.callServerEndpoint<_i3.Chemists?>(
        'chemists',
        'currentChemists',
        {},
      );

  _i2.Future<List<_i3.Chemists>> getChemists(String name) =>
      caller.callServerEndpoint<List<_i3.Chemists>>(
        'chemists',
        'getChemists',
        {'name': name},
      );

  _i2.Future<void> getChemistsGeo() => caller.callServerEndpoint<void>(
        'chemists',
        'getChemistsGeo',
        {},
      );

  _i2.Future<void> updateChemists(_i3.Chemists chemists) =>
      caller.callServerEndpoint<void>(
        'chemists',
        'updateChemists',
        {'chemists': chemists},
      );
}

class _EndpointDoctor extends _i1.EndpointRef {
  _EndpointDoctor(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'doctor';

  _i2.Future<void> addDoctor(_i4.Doctor doctor) =>
      caller.callServerEndpoint<void>(
        'doctor',
        'addDoctor',
        {'doctor': doctor},
      );

  _i2.Future<_i4.Doctor?> currentDoctor() =>
      caller.callServerEndpoint<_i4.Doctor?>(
        'doctor',
        'currentDoctor',
        {},
      );

  _i2.Future<List<_i4.Doctor>> getDoctor(String name) =>
      caller.callServerEndpoint<List<_i4.Doctor>>(
        'doctor',
        'getDoctor',
        {'name': name},
      );

  _i2.Future<List<_i4.Doctor>> getDoctorByAge(int age) =>
      caller.callServerEndpoint<List<_i4.Doctor>>(
        'doctor',
        'getDoctorByAge',
        {'age': age},
      );

  _i2.Future<List<_i4.Doctor>> getDoctorByAgeAndName(
    int age,
    String name,
  ) =>
      caller.callServerEndpoint<List<_i4.Doctor>>(
        'doctor',
        'getDoctorByAgeAndName',
        {
          'age': age,
          'name': name,
        },
      );

  _i2.Future<void> updateDoctor(_i4.Doctor doctor) =>
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

  _i2.Future<String?> addMedicine(_i5.Medicine medicine) =>
      caller.callServerEndpoint<String?>(
        'medicine',
        'addMedicine',
        {'medicine': medicine},
      );

  _i2.Future<List<_i5.Medicine?>> getMedicines() =>
      caller.callServerEndpoint<List<_i5.Medicine?>>(
        'medicine',
        'getMedicines',
        {},
      );
}

class _EndpointPatient extends _i1.EndpointRef {
  _EndpointPatient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'patient';

  _i2.Future<void> cratePatient(_i6.Patient patient) =>
      caller.callServerEndpoint<void>(
        'patient',
        'cratePatient',
        {'patient': patient},
      );

  _i2.Future<_i6.Patient?> currentPatient() =>
      caller.callServerEndpoint<_i6.Patient?>(
        'patient',
        'currentPatient',
        {},
      );

  _i2.Future<List<_i6.Patient>> getPatient() =>
      caller.callServerEndpoint<List<_i6.Patient>>(
        'patient',
        'getPatient',
        {},
      );

  _i2.Future<bool> updatePatient(_i6.Patient patient) =>
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

  _i2.Future<_i7.ByteData?> getPublicUrl(String path) =>
      caller.callServerEndpoint<_i7.ByteData?>(
        'patient',
        'getPublicUrl',
        {'path': path},
      );

  _i2.Future<void> StoreFile(
    String path,
    _i7.ByteData byteData,
  ) =>
      caller.callServerEndpoint<void>(
        'patient',
        'StoreFile',
        {
          'path': path,
          'byteData': byteData,
        },
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i9.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i10.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    chemists = _EndpointChemists(this);
    doctor = _EndpointDoctor(this);
    medicine = _EndpointMedicine(this);
    patient = _EndpointPatient(this);
    modules = _Modules(this);
  }

  late final _EndpointChemists chemists;

  late final _EndpointDoctor doctor;

  late final _EndpointMedicine medicine;

  late final _EndpointPatient patient;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'chemists': chemists,
        'doctor': doctor,
        'medicine': medicine,
        'patient': patient,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
