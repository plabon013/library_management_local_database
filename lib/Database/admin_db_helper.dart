import 'package:library_manager/models/admin_db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class AdminDBHelper {
  static const _createAdminInfoTable = '''
  create table $adminTableName(
  $adminTableId integer primary key,
  $adminTableAdminImage text,
  $adminTableAdminName text,
  $adminTableAdminEmail text,
  $adminTableAdminPassword text
)
''';

  static Future<Database> open() async {
    final root = await getDatabasesPath();
    final dbPath = path.join(root, "admin_info.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(_createAdminInfoTable);
    });
  }

  static Future<int> insertAdmin(AdminDatabaseModel adminDatabaseModel) async {
    final db = await open();
    return db.insert(adminTableName, adminDatabaseModel.toMap());
  }

    static Future<AdminDatabaseModel> getValidAdminInfo(String adminEmail) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(adminTableName,where: "$adminTableAdminEmail = ?", whereArgs: [adminEmail]);
    return mapList.isNotEmpty ?   AdminDatabaseModel.fromMap( mapList.first) : AdminDatabaseModel(adminName: "", adminEmail: "", adminPassword: "");
  }


  static Future<AdminDatabaseModel> getAdmin() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(adminTableName);
    return AdminDatabaseModel.fromMap(mapList.last);
  }


 


}
