import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:supply_cabinet/smodel/sale.dart';

class DatabaseProvider {
  static const String TABLE_SALE = "SALE";
  static const String COLUMN_ID = "id";
  static const String COLUMN_SALENAME = "saleName";
  static const String COLUMN_CUSTOMERNAME = "customerName";
  static const String COLUMN_QUENTITY = "quentity";
  static const String COLUMN_SALEPRICE = "salePrice";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'saleDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating sale table");

        await database.execute(
          "CREATE TABLE $TABLE_SALE ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_SALENAME TEXT,"
          "$COLUMN_CUSTOMERNAME TEXT,"
          "$COLUMN_QUENTITY INTEGER,"
          "$COLUMN_SALEPRICE INTEGER"
          ")",
        );
      },
    );
  }

  Future<List<Sale>> getSales() async {
    final db = await database;

    var sales = await db.query(TABLE_SALE, columns: [
      COLUMN_ID,
      COLUMN_SALENAME,
      COLUMN_CUSTOMERNAME,
      COLUMN_QUENTITY,
      COLUMN_SALEPRICE
    ]);

    List<Sale> saleList = List<Sale>();

    sales.forEach((currentSale) {
      Sale sale = Sale.fromMap(currentSale);

      saleList.add(sale);
    });

    return saleList;
  }

  Future<Sale> insert(Sale sale) async {
    final db = await database;
    sale.id = await db.insert(TABLE_SALE, sale.toMap());
    return sale;
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_SALE,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Sale sale) async {
    final db = await database;

    return await db.update(
      TABLE_SALE,
      sale.toMap(),
      where: "id = ?",
      whereArgs: [sale.id],
    );
  }
}
