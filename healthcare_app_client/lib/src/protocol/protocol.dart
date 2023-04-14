/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'chemists.dart' as _i2;
import 'doctor.dart' as _i3;
import 'geopoint.dart' as _i4;
import 'invertory.dart' as _i5;
import 'medicine.dart' as _i6;
import 'patient.dart' as _i7;
import 'protocol.dart' as _i8;
import 'package:healthcare_app_client/src/protocol/chemists.dart' as _i9;
import 'package:healthcare_app_client/src/protocol/doctor.dart' as _i10;
import 'package:healthcare_app_client/src/protocol/invertory.dart' as _i11;
import 'package:healthcare_app_client/src/protocol/medicine.dart' as _i12;
import 'package:healthcare_app_client/src/protocol/patient.dart' as _i13;
import 'package:serverpod_auth_client/module.dart' as _i14;
export 'chemists.dart';
export 'doctor.dart';
export 'geopoint.dart';
export 'invertory.dart';
export 'medicine.dart';
export 'patient.dart';
export 'client.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Chemists) {
      return _i2.Chemists.fromJson(data, this) as T;
    }
    if (t == _i3.Doctor) {
      return _i3.Doctor.fromJson(data, this) as T;
    }
    if (t == _i4.GeoPoint) {
      return _i4.GeoPoint.fromJson(data, this) as T;
    }
    if (t == _i5.Inventory) {
      return _i5.Inventory.fromJson(data, this) as T;
    }
    if (t == _i6.Medicine) {
      return _i6.Medicine.fromJson(data, this) as T;
    }
    if (t == _i7.Patient) {
      return _i7.Patient.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Chemists?>()) {
      return (data != null ? _i2.Chemists.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Doctor?>()) {
      return (data != null ? _i3.Doctor.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.GeoPoint?>()) {
      return (data != null ? _i4.GeoPoint.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Inventory?>()) {
      return (data != null ? _i5.Inventory.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Medicine?>()) {
      return (data != null ? _i6.Medicine.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Patient?>()) {
      return (data != null ? _i7.Patient.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i8.Inventory?>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Inventory?>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i9.Chemists>) {
      return (data as List).map((e) => deserialize<_i9.Chemists>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Doctor>) {
      return (data as List).map((e) => deserialize<_i10.Doctor>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i11.Inventory>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Inventory>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i12.Medicine?>) {
      return (data as List).map((e) => deserialize<_i12.Medicine?>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i13.Patient>) {
      return (data as List).map((e) => deserialize<_i13.Patient>(e)).toList()
          as dynamic;
    }
    try {
      return _i14.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i14.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Chemists) {
      return 'Chemists';
    }
    if (data is _i3.Doctor) {
      return 'Doctor';
    }
    if (data is _i4.GeoPoint) {
      return 'GeoPoint';
    }
    if (data is _i5.Inventory) {
      return 'Inventory';
    }
    if (data is _i6.Medicine) {
      return 'Medicine';
    }
    if (data is _i7.Patient) {
      return 'Patient';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i14.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Chemists') {
      return deserialize<_i2.Chemists>(data['data']);
    }
    if (data['className'] == 'Doctor') {
      return deserialize<_i3.Doctor>(data['data']);
    }
    if (data['className'] == 'GeoPoint') {
      return deserialize<_i4.GeoPoint>(data['data']);
    }
    if (data['className'] == 'Inventory') {
      return deserialize<_i5.Inventory>(data['data']);
    }
    if (data['className'] == 'Medicine') {
      return deserialize<_i6.Medicine>(data['data']);
    }
    if (data['className'] == 'Patient') {
      return deserialize<_i7.Patient>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
