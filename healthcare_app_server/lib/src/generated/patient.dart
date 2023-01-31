/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/module.dart' as _i2;

class Patient extends _i1.TableRow {
  Patient({
    int? id,
    required this.name,
    required this.age,
    required this.gender,
    this.weight,
    this.height,
    required this.createdAt,
    required this.userInfo,
  }) : super(id);

  factory Patient.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Patient(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      age: serializationManager.deserialize<int>(jsonSerialization['age']),
      gender:
          serializationManager.deserialize<String>(jsonSerialization['gender']),
      weight: serializationManager
          .deserialize<String?>(jsonSerialization['weight']),
      height: serializationManager
          .deserialize<String?>(jsonSerialization['height']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      userInfo: serializationManager
          .deserialize<_i2.UserInfo>(jsonSerialization['userInfo']),
    );
  }

  static final t = PatientTable();

  String name;

  int age;

  String gender;

  String? weight;

  String? height;

  DateTime createdAt;

  _i2.UserInfo userInfo;

  @override
  String get tableName => 'patient';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'createdAt': createdAt,
      'userInfo': userInfo,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'createdAt': createdAt,
      'userInfo': userInfo,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'createdAt': createdAt,
      'userInfo': userInfo,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'age':
        age = value;
        return;
      case 'gender':
        gender = value;
        return;
      case 'weight':
        weight = value;
        return;
      case 'height':
        height = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      case 'userInfo':
        userInfo = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Patient>> find(
    _i1.Session session, {
    PatientExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Patient>(
      where: where != null ? where(Patient.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Patient?> findSingleRow(
    _i1.Session session, {
    PatientExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Patient>(
      where: where != null ? where(Patient.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Patient?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Patient>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PatientExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Patient>(
      where: where(Patient.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Patient row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Patient row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Patient row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PatientExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Patient>(
      where: where != null ? where(Patient.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PatientExpressionBuilder = _i1.Expression Function(PatientTable);

class PatientTable extends _i1.Table {
  PatientTable() : super(tableName: 'patient');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final age = _i1.ColumnInt('age');

  final gender = _i1.ColumnString('gender');

  final weight = _i1.ColumnString('weight');

  final height = _i1.ColumnString('height');

  final createdAt = _i1.ColumnDateTime('createdAt');

  final userInfo = _i1.ColumnSerializable('userInfo');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        age,
        gender,
        weight,
        height,
        createdAt,
        userInfo,
      ];
}

@Deprecated('Use PatientTable.t instead.')
PatientTable tPatient = PatientTable();
