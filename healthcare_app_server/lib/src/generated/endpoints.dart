/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/doctor_endpoint.dart' as _i2;
import '../endpoints/medicine_endpoint.dart' as _i3;
import '../endpoints/patient_endpoint.dart' as _i4;
import 'package:healthcare_app_server/src/generated/doctor.dart' as _i5;
import 'package:healthcare_app_server/src/generated/medicine.dart' as _i6;
import 'package:healthcare_app_server/src/generated/patient.dart' as _i7;
import 'package:serverpod_auth_server/module.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'doctor': _i2.DoctorEndpoint()
        ..initialize(
          server,
          'doctor',
          null,
        ),
      'medicine': _i3.MedicineEndpoint()
        ..initialize(
          server,
          'medicine',
          null,
        ),
      'patient': _i4.PatientEndpoint()
        ..initialize(
          server,
          'patient',
          null,
        ),
    };
    connectors['doctor'] = _i1.EndpointConnector(
      name: 'doctor',
      endpoint: endpoints['doctor']!,
      methodConnectors: {
        'addDoctor': _i1.MethodConnector(
          name: 'addDoctor',
          params: {
            'doctor': _i1.ParameterDescription(
              name: 'doctor',
              type: _i1.getType<_i5.Doctor>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i2.DoctorEndpoint).addDoctor(
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
              (endpoints['doctor'] as _i2.DoctorEndpoint)
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
              (endpoints['doctor'] as _i2.DoctorEndpoint).getDoctor(
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
              (endpoints['doctor'] as _i2.DoctorEndpoint).getDoctorByAge(
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
              (endpoints['doctor'] as _i2.DoctorEndpoint).getDoctorByAgeAndName(
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
              type: _i1.getType<_i5.Doctor>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['doctor'] as _i2.DoctorEndpoint).updateDoctor(
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
              type: _i1.getType<_i6.Medicine>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['medicine'] as _i3.MedicineEndpoint).addMedicine(
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
              (endpoints['medicine'] as _i3.MedicineEndpoint)
                  .getMedicines(session),
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
              type: _i1.getType<_i7.Patient>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i4.PatientEndpoint).cratePatient(
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
              (endpoints['patient'] as _i4.PatientEndpoint)
                  .currentPatient(session),
        ),
        'getPatient': _i1.MethodConnector(
          name: 'getPatient',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i4.PatientEndpoint).getPatient(session),
        ),
        'updatePatient': _i1.MethodConnector(
          name: 'updatePatient',
          params: {
            'patient': _i1.ParameterDescription(
              name: 'patient',
              type: _i1.getType<_i7.Patient>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['patient'] as _i4.PatientEndpoint).updatePatient(
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
              (endpoints['patient'] as _i4.PatientEndpoint)
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
              (endpoints['patient'] as _i4.PatientEndpoint).verifyUpload(
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
              (endpoints['patient'] as _i4.PatientEndpoint).getPublicUrl(
            session,
            params['path'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
