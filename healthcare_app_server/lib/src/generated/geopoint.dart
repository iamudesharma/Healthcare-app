/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class GeoPoint extends _i1.TableRow {
  GeoPoint({
    int? id,
    required this.lat,
    required this.long,
  }) : super(id);

  factory GeoPoint.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GeoPoint(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      lat: serializationManager.deserialize<double>(jsonSerialization['lat']),
      long: serializationManager.deserialize<double>(jsonSerialization['long']),
    );
  }

  static final t = GeoPointTable();

  double lat;

  double long;

  @override
  String get tableName => 'geopoint';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lat': lat,
      'long': long,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'lat': lat,
      'long': long,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'lat': lat,
      'long': long,
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
      case 'lat':
        lat = value;
        return;
      case 'long':
        long = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<GeoPoint>> find(
    _i1.Session session, {
    GeoPointExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GeoPoint>(
      where: where != null ? where(GeoPoint.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<GeoPoint?> findSingleRow(
    _i1.Session session, {
    GeoPointExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<GeoPoint>(
      where: where != null ? where(GeoPoint.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<GeoPoint?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<GeoPoint>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required GeoPointExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GeoPoint>(
      where: where(GeoPoint.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    GeoPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    GeoPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    GeoPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    GeoPointExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GeoPoint>(
      where: where != null ? where(GeoPoint.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef GeoPointExpressionBuilder = _i1.Expression Function(GeoPointTable);

class GeoPointTable extends _i1.Table {
  GeoPointTable() : super(tableName: 'geopoint');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final lat = _i1.ColumnDouble('lat');

  final long = _i1.ColumnDouble('long');

  @override
  List<_i1.Column> get columns => [
        id,
        lat,
        long,
      ];
}

@Deprecated('Use GeoPointTable.t instead.')
GeoPointTable tGeoPoint = GeoPointTable();
