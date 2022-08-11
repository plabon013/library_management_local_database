const String adminTableName = "admin_info";
const String adminTableId = "id";
const String adminTableAdminImage = "image";
const String adminTableAdminName = "name";
const String adminTableAdminEmail = "email";
const String adminTableAdminPassword = "password";

class AdminDatabaseModel {
  int? id;
  String? adminImage;
  String adminName;
  String adminEmail;
  String adminPassword;

  AdminDatabaseModel(
      {this.id,
      this.adminImage,
      required this.adminName,
      required this.adminEmail,
      required this.adminPassword});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      adminTableAdminImage: adminImage,
      adminTableAdminName: adminName,
      adminTableAdminEmail: adminEmail,
      adminTableAdminPassword: adminPassword
    };
    if (id != null) {
      map[adminTableId] = id;
    }
    return map;
  }

  factory AdminDatabaseModel.fromMap(Map<String, dynamic> map) =>
      AdminDatabaseModel(
          id: map[adminTableId],
          adminImage: map[adminTableAdminImage],
          adminName: map[adminTableAdminName],
          adminEmail: map[adminTableAdminEmail],
          adminPassword: map[adminTableAdminPassword]);

  @override
  String toString() {
    return 'AdminDatabaseModel{id: $id, adminImage: $adminImage, adminName: $adminName, adminEmail: $adminEmail, adminPassword: $adminPassword}';
  }
}
