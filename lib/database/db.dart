import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? db;

  Future<Database> checkDatabase() async {
    if (db != null) {
      return db!;
    } else {
      return await createDatabase();
    }
  }

  Future<Database> createDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String path = join(folder.path, "product.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT,product_name TEXT,product_quantity TEXT,product_price TEXT,stock_status INTEGER)";
        db.execute(query);
      },
    );
  }

  void insertData(String name, String quantity, String price,int stock_status) async {
    db = await checkDatabase();
    db!.insert("product", {"product_name":name,"product_quantity":quantity,"product_price":price,"stock_status":stock_status});
  }

  Future<List<Map>> readData() async {
    db = await checkDatabase();
    String query = "SELECT * FROM product";
    List<Map> detailslist = await db!.rawQuery(query, null);

    return detailslist;
  }

  void updateData(String id, int stock_status) async {
    db = await checkDatabase();
    db!.update("product", {"stock_status": stock_status},
        where: "id = ?", whereArgs: [int.parse(id)]);
  }

}