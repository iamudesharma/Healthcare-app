/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Doctor extends _i1.TableRow {
  Doctor({
    int? id,
    this.name,
    this.age,
    this.address,
    this.fees,
    this.experience,
    this.geoPoint,
  }) : super(id);

  factory Doctor.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Doctor(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name:
          serializationManager.deserialize<String?>(jsonSerialization['name']),
      age: serializationManager.deserialize<int?>(jsonSerialization['age']),
      address: serializationManager
          .deserialize<String?>(jsonSerialization['address']),
      fees: serializationManager.deserialize<int?>(jsonSerialization['fees']),
      experience: serializationManager
          .deserialize<int?>(jsonSerialization['experience']),
      geoPoint: serializationManager
          .deserialize<_i2.GeoPoint?>(jsonSerialization['geoPoint']),
    );
  }

  static final t = DoctorTable();

  String? name;

  int? age;

  String? address;

  int? fees;

  int? experience;

  _i2.GeoPoint? geoPoint;

  @override
  String get tableName => 'doctor';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'fees': fees,
      'experience': experience,
      'geoPoint': geoPoint,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'fees': fees,
      'experience': experience,
      'geoPoint': geoPoint,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'fees': fees,
      'experience': experience,
      'geoPoint': geoPoint,
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
      case 'address':
        address = value;
        return;
      case 'fees':
        fees = value;
        return;
      case 'experience':
        experience = value;
        return;
      case 'geoPoint':
        geoPoint = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Doctor>> find(
    _i1.Session session, {
    DoctorExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Doctor>(
      where: where != null ? where(Doctor.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Doctor?> findSingleRow(
    _i1.Session session, {
    DoctorExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Doctor>(
      where: where != null ? where(Doctor.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Doctor?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Doctor>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required DoctorExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Doctor>(
      where: where(Doctor.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Doctor row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Doctor row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Doctor row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    DoctorExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Doctor>(
      where: where != null ? where(Doctor.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef DoctorExpressionBuilder = _i1.Expression Function(DoctorTable);

class DoctorTable extends _i1.Table {
  DoctorTable() : super(tableName: 'doctor');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final age = _i1.ColumnInt('age');

  final address = _i1.ColumnString('address');

  final fees = _i1.ColumnInt('fees');

  final experience = _i1.ColumnInt('experience');

  final geoPoint = _i1.ColumnSerializable('geoPoint');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        age,
        address,
        fees,
        experience,
        geoPoint,
      ];
}

@Deprecated('Use DoctorTable.t instead.')
DoctorTable tDoctor = DoctorTable();
