/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Inventory extends _i1.TableRow {
  Inventory({
    int? id,
    required this.medicineId,
    required this.price,
    required this.stock,
  }) : super(id);

  factory Inventory.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Inventory(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      medicineId: serializationManager
          .deserialize<int>(jsonSerialization['medicineId']),
      price: serializationManager.deserialize<int>(jsonSerialization['price']),
      stock: serializationManager.deserialize<int>(jsonSerialization['stock']),
    );
  }

  static final t = InventoryTable();

  int medicineId;

  int price;

  int stock;

  @override
  String get tableName => 'inventory';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medicineId': medicineId,
      'price': price,
      'stock': stock,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'medicineId': medicineId,
      'price': price,
      'stock': stock,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'medicineId': medicineId,
      'price': price,
      'stock': stock,
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
      case 'medicineId':
        medicineId = value;
        return;
      case 'price':
        price = value;
        return;
      case 'stock':
        stock = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Inventory>> find(
    _i1.Session session, {
    InventoryExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Inventory>(
      where: where != null ? where(Inventory.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Inventory?> findSingleRow(
    _i1.Session session, {
    InventoryExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Inventory>(
      where: where != null ? where(Inventory.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Inventory?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Inventory>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required InventoryExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Inventory>(
      where: where(Inventory.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Inventory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Inventory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Inventory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    InventoryExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Inventory>(
      where: where != null ? where(Inventory.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef InventoryExpressionBuilder = _i1.Expression Function(InventoryTable);

class InventoryTable extends _i1.Table {
  InventoryTable() : super(tableName: 'inventory');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final medicineId = _i1.ColumnInt('medicineId');

  final price = _i1.ColumnInt('price');

  final stock = _i1.ColumnInt('stock');

  @override
  List<_i1.Column> get columns => [
        id,
        medicineId,
        price,
        stock,
      ];
}

@Deprecated('Use InventoryTable.t instead.')
InventoryTable tInventory = InventoryTable();
