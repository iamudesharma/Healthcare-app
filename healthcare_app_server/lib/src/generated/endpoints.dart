/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/chemists_endpoint.dart' as _i2;
import '../endpoints/doctor_endpoint.dart' as _i3;
import '../endpoints/medicine_endpoint.dart' as _i4;
import '../endpoints/patient_endpoint.dart' as _i5;
import 'package:healthcare_app_server/src/generated/chemists.dart' as _i6;
import 'package:healthcare_app_server/src/generated/doctor.dart' as _i7;
import 'package:healthcare_app_server/src/generated/medicine.dart' as _i8;
import 'package:healthcare_app_server/src/generated/patient.dart' as _i9;
import 'dart:typed_data' as _i10;
import 'package:serverpod_auth_server/module.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'chemists': _i2.ChemistsEndpoint()
        ..initialize(
          server,
          'chemists',
          null,
        ),
      'doctor': _i3.DoctorEndpoint()
        ..initialize(
          server,
          'doctor',
          null,
        ),
      'medicine': _i4.MedicineEndpoint()
        ..initialize(
          server,
          'medicine',
          null,
        ),
      'patient': _i5.PatientEndpoint()
        ..initialize(
          server,
          'patient',
          null,
        ),
    };
    connectors['chemists'] = _i1.EndpointConnector(
      name: 'chemists',
      endpoint: endpoints['chemists']!,
      methodConnectors: {
        'addChemists': _i1.MethodConnector(
          name: 'addChemists',
          params: {
            'chemists': _i1.ParameterDescription(
              name: 'chemists',
              type: _i1.getType<_i6.Chemists>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chemists'] as _i2.ChemistsEndpoint).addChemists(
            session,
            params['chemists'],
          ),
        ),
        'currentChemists': _i1.MethodConnector(
          name: 'currentChemists',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chemists'] as _i2.ChemistsEndpoint)
                  .currentChemists(session),
        ),
        'getChemists': _i1.MethodConnector(
          name: 'getChemists',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chemists'] as _i2.ChemistsEndpoint).getChemists(
            session,
            params['name'],
          ),
        ),
        'updateChemists': _i1.MethodConnector(
          name: 'updateChemists',
          params: {
            'chemists': _i1.ParameterDescription(
              name: 'chemists',
              type: _i1.getType<_i6.Chemists>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chemists'] as _i2.ChemistsEndpoint).updateChemists(
            session,
            params['chemists'],
          ),
        ),
      },
    );
    connectors['doctor'] = _i1.EndpointConnector(
      name: 'doctor',
      endpoint: endpoints['doctor']!,
      methodConnectors: {
        'addDoctor': _i1.MethodConnector(
          name: 'addDoctor',
          params: {
            'doctor': _i1.ParameterDescription(
              name: 'doctor',
              type: _i1.getType<_i7.Doctor>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i3.DoctorEndpoint).addDoctor(
            session,
            params['doctor'],
          ),
        ),
        'currentDoctor': _i1.MethodConnector(
          name: 'currentDoctor',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i3.DoctorEndpoint)
                  .currentDoctor(session),
        ),
        'getDoctor': _i1.MethodConnector(
          name: 'getDoctor',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i3.DoctorEndpoint).getDoctor(
            session,
            params['name'],
          ),
        ),
        'getDoctorByAge': _i1.MethodConnector(
          name: 'getDoctorByAge',
          params: {
            'age': _i1.ParameterDescription(
              name: 'age',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i3.DoctorEndpoint).getDoctorByAge(
            session,
            params['age'],
          ),
        ),
        'getDoctorByAgeAndName': _i1.MethodConnector(
          name: 'getDoctorByAgeAndName',
          params: {
            'age': _i1.ParameterDescription(
              name: 'age',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i3.DoctorEndpoint).getDoctorByAgeAndName(
            session,
            params['age'],
            params['name'],
          ),
        ),
        'updateDoctor': _i1.MethodConnector(
          name: 'updateDoctor',
          params: {
            'doctor': _i1.ParameterDescription(
              name: 'doctor',
              type: _i1.getType<_i7.Doctor>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i3.DoctorEndpoint).updateDoctor(
            session,
            params['doctor'],
          ),
        ),
      },
    );
    connectors['medicine'] = _i1.EndpointConnector(
      name: 'medicine',
      endpoint: endpoints['medicine']!,
      methodConnectors: {
        'addMedicine': _i1.MethodConnector(
          name: 'addMedicine',
          params: {
            'medicine': _i1.ParameterDescription(
              name: 'medicine',
              type: _i1.getType<_i8.Medicine>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['medicine'] as _i4.MedicineEndpoint).addMedicine(
            session,
            params['medicine'],
          ),
        ),
        'getMedicines': _i1.MethodConnector(
          name: 'getMedicines',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['medicine'] as _i4.MedicineEndpoint)
                  .getMedicines(session),
        ),
        'searchMedicine': _i1.MethodConnector(
          name: 'searchMedicine',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['medicine'] as _i4.MedicineEndpoint).searchMedicine(
            session,
            params['query'],
            limit: params['limit'],
          ),
        ),
        'searchSuggestionsForMedicine': _i1.MethodConnector(
          name: 'searchSuggestionsForMedicine',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['medicine'] as _i4.MedicineEndpoint)
                  .searchSuggestionsForMedicine(
            session,
            params['query'],
          ),
        ),
      },
    );
    connectors['patient'] = _i1.EndpointConnector(
      name: 'patient',
      endpoint: endpoints['patient']!,
      methodConnectors: {
        'cratePatient': _i1.MethodConnector(
          name: 'cratePatient',
          params: {
            'patient': _i1.ParameterDescription(
              name: 'patient',
              type: _i1.getType<_i9.Patient>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint).cratePatient(
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
              (endpoints['patient'] as _i5.PatientEndpoint)
                  .currentPatient(session),
        ),
        'getPatient': _i1.MethodConnector(
          name: 'getPatient',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint).getPatient(session),
        ),
        'updatePatient': _i1.MethodConnector(
          name: 'updatePatient',
          params: {
            'patient': _i1.ParameterDescription(
              name: 'patient',
              type: _i1.getType<_i9.Patient>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint).updatePatient(
            session,
            params['patient'],
          ),
        ),
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint)
                  .getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
        'getPublicUrl': _i1.MethodConnector(
          name: 'getPublicUrl',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint).getPublicUrl(
            session,
            params['path'],
          ),
        ),
        'StoreFile': _i1.MethodConnector(
          name: 'StoreFile',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'byteData': _i1.ParameterDescription(
              name: 'byteData',
              type: _i1.getType<_i10.ByteData>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i5.PatientEndpoint).StoreFile(
            session,
            params['path'],
            params['byteData'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i11.Endpoints()..initializeEndpoints(server);
  }
}
