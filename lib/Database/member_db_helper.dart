
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../models/member_model.dart';

class MemberDBHelper{
  static const _createMemberInfoTable = '''
  create table $memberTableName(
  $memberTableId integer primary key,
  $memberTableMemberImage text,
  $memberTableMemberName text,
  $memberTableMemberEmail text,
  $memberTableMemberphone text,
  $memberTableMemberAddress text,
  $memberTableMemberDepartment text
)
''';

  static Future<Database> open() async {
    final root = await getDatabasesPath();
    final dbPath = path.join(root, "member_info.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(_createMemberInfoTable);
    });
  }

    static Future<int> insertMember(MemberModel memberModel) async {
    final db = await open();
    return db.insert(memberTableName, memberModel.toMap());
  }

  static Future<MemberModel> getValidMemberInfo(String memberEmail) async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(memberTableName,where: "$memberTableMemberEmail = ?", whereArgs: [memberEmail]);
    return mapList.isNotEmpty ? MemberModel.fromMap(mapList.first): MemberModel(memberImage: "", memberName: "", memberEmail: "", memberPhone: "", memberAddress: "", memberDept: "");
  }

  static Future<List<MemberModel>> getAllMembers() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(memberTableName, orderBy: memberTableMemberName);
    return List.generate(mapList.length, (index) => MemberModel.fromMap(mapList[index]));
  }



}