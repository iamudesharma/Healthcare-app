/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'patient.dart' as _i2;
import 'package:healthcare_app_client/src/protocol/patient.dart' as _i3;
import 'package:serverpod_auth_client/module.dart' as _i4;
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
    if (t == _i2.Patient) {
      return _i2.Patient.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Patient?>()) {
      return (data != null ? _i2.Patient.fromJson(data, this) : null) as T;
    }
    if (t == List<_i3.Patient?>) {
      return (data as List).map((e) => deserialize<_i3.Patient?>(e)).toList()
          as dynamic;
    }
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Patient) {
      return 'Patient';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Patient') {
      return deserialize<_i2.Patient>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
