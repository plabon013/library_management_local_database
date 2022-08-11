const String readerTableName = "reader_info";
const String readerTableId = "id";
const String readerTableReaderImage = "image";
const String readerTableReaderName = "name";
const String readerTableReaderEmail = "email";
const String readerTableReaderphone = "phone";
const String readerTableReaderAddress = "address";
const String readerTableReaderDepartment = "Department";
const String readerTableReaderBookName = "Book_Name";
const String readerTableReaderGiveDate = "Give_Date";
const String readerTableReaderReturnDate = "Return_Date";

class ReaderModel {
  int? id;
  String  readerImage;
  String readerName;
  String readerEmail;
  String readerPhone;
  String readerAddress;
  String readerDept;
  String readerBookName;
  String giveDate;
  String returnDate;

  ReaderModel(
      {this.id,
      required this.readerImage,
      required this.readerName,
      required this.readerEmail,
      required this.readerPhone,
      required this.readerAddress,
      required this.readerDept,
      required this.readerBookName,
      required this.giveDate,
      required this.returnDate});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      readerTableReaderImage: readerImage,
      readerTableReaderName: readerName,
      readerTableReaderEmail: readerEmail,
      readerTableReaderphone: readerPhone,
      readerTableReaderAddress: readerAddress,
      readerTableReaderDepartment: readerDept,
      readerTableReaderBookName: readerBookName,
      readerTableReaderGiveDate: giveDate,
      readerTableReaderReturnDate: returnDate
    };
    if (id != null) {
      map[readerTableId] = id;
    }

    return map;
  }

  factory ReaderModel.fromMap(Map<String, dynamic> map) => ReaderModel(
      id: map[readerTableId],
      readerImage: map[readerTableReaderImage],
      readerName: map[readerTableReaderName],
      readerEmail: map[readerTableReaderEmail],
      readerPhone: map[readerTableReaderphone],
      readerAddress: map[readerTableReaderAddress],
      readerDept: map[readerTableReaderDepartment],
      readerBookName: map[readerTableReaderBookName],
      giveDate: map[readerTableReaderGiveDate],
      returnDate: map[readerTableReaderReturnDate]);

  @override
  String toString() {
    return 'ReaderModel{id: $id, readerImage: $readerImage, readerName: $readerName, readerEmail: $readerEmail, readerPhone: $readerPhone, readerAddress: $readerAddress,readerDept: $readerDept, readerBookName: $readerBookName,giveDate: $giveDate,returnDate: $returnDate,}';
  }
}
