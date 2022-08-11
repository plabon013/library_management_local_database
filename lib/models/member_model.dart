const String memberTableName = "member_info";
const String memberTableId = "id";
const String memberTableMemberImage = "image";
const String memberTableMemberName = "name";
const String memberTableMemberEmail = "email";
const String memberTableMemberphone = "phone";
const String memberTableMemberAddress = "address";
const String memberTableMemberDepartment = "Department";

class MemberModel {
  int? id;
  String memberImage;
  String memberName;
  String memberEmail;
  String memberPhone;
  String memberAddress;
  String memberDept;

  MemberModel(
      {this.id,
      required  this.memberImage,
      required this.memberName,
      required this.memberEmail,
      required this.memberPhone,
      required this.memberAddress,
      required this.memberDept});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      memberTableMemberImage: memberImage,
      memberTableMemberName: memberName,
      memberTableMemberEmail: memberEmail,
      memberTableMemberphone: memberPhone,
      memberTableMemberAddress: memberAddress,
      memberTableMemberDepartment: memberDept
    };
    if (id != null) {
      map[memberTableId] = id;
    }

    return map;
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) => MemberModel(
      id: map[memberTableId],
      memberImage: map[memberTableMemberImage],
      memberName: map[memberTableMemberName],
      memberEmail: map[memberTableMemberEmail],
      memberPhone: map[memberTableMemberphone],
      memberAddress: map[memberTableMemberAddress],
      memberDept: map[memberTableMemberDepartment]);

  @override
  String toString() {
    return 'MemberModel{id: $id, memberImage: $memberImage, memberName: $memberName, memberEmail: $memberEmail, memberPhone: $memberPhone, memberAddress: $memberAddress,memberDept: $memberDept, }';
  }
  
}
