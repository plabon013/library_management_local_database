
import 'package:intl/intl.dart';
import 'package:library_manager/models/reader_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class ReaderDBHelper{

  static const _createReaderInfoTable = '''
  create table $readerTableName(
  $readerTableId integer primary key,
  $readerTableReaderImage text,
  $readerTableReaderName text,
  $readerTableReaderEmail text,
  $readerTableReaderphone text,
  $readerTableReaderAddress text,
  $readerTableReaderDepartment text,
  $readerTableReaderBookName text,
  $readerTableReaderGiveDate text,
  $readerTableReaderReturnDate text
)
''';



  static Future<Database> open() async {
    final root = await getDatabasesPath();
    final dbPath = path.join(root, "reader_info.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(_createReaderInfoTable);
    });
  }

  static Future<int> insertReader(ReaderModel readerModel) async {
    final db = await open();
    return db.insert(readerTableName, readerModel.toMap());
  }
 static Future<List<ReaderModel>> getAllReader() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(readerTableName);
    return List.generate(mapList.length, (index) => ReaderModel.fromMap(mapList[index]));
  }
  

   static Future<List<ReaderModel>> getAllDelayedReader() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(readerTableName,where: "$readerTableReaderReturnDate < ?", whereArgs: [DateFormat("yyy/MM/dd").format(DateTime.now())]);
    return List.generate(mapList.length, (index) => ReaderModel.fromMap(mapList[index]));

  }

  
   static Future<List<ReaderModel>> getTodayReturnBooks() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(readerTableName,where: "$readerTableReaderReturnDate = ?", whereArgs: [DateFormat("yyy/MM/dd").format(DateTime.now())]);
    return List.generate(mapList.length, (index) => ReaderModel.fromMap(mapList[index]));

  }
     static Future<List<ReaderModel>> getSameNameOfBook(String bookName) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(readerTableName,where: "$readerTableReaderBookName = ?", whereArgs: [bookName]);
    return List.generate(mapList.length, (index) => ReaderModel.fromMap(mapList[index]));

  }

    static Future<int> deleteReader(int id) async{
    final db = await open();
    return db.delete(readerTableName,where: '$readerTableId = ?', whereArgs: [id]);
  }


}