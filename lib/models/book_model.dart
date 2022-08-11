 
const String booksTableName = "book_info";
const String booksTableColId = "id";
const String booksTableBookImageColName = "image";
const String booksTableBookColName = "book_name";
const String booksTableBookColAuthorName = "author_name";
const String booksTableBookQuantityColName = "quantity";
const String booksTableBookDescriptionColName = "description";
const String booksTableBookCategoryColName = "category";

class BookModel {
  int? id;
  String bookImage;
  String bookName;
  String authorName;
  int bookQuantity;
  String bookDescription;
  String bookCategory;

  BookModel(
      {this.id,
      required this.bookImage,
      required this.bookName,
      required this.authorName,
      required this.bookQuantity,
      required this.bookDescription,
      required this.bookCategory});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      booksTableBookImageColName: bookImage,
      booksTableBookColName: bookName,
      booksTableBookColAuthorName: authorName,
      booksTableBookQuantityColName: bookQuantity,
      booksTableBookDescriptionColName: bookDescription,
      booksTableBookCategoryColName: bookCategory
    };
    if (id != null) {
      map[booksTableColId] = id;
    }
    return map;
  }

  factory BookModel.fromMap(Map<String, dynamic> map) => BookModel(
      id: map[booksTableColId],
      bookImage: map[booksTableBookImageColName],
      bookName: map[booksTableBookColName],
      authorName: map[booksTableBookColAuthorName],
      bookQuantity: map[booksTableBookQuantityColName],
      bookDescription: map[booksTableBookDescriptionColName],
      bookCategory: map[booksTableBookCategoryColName]);

  @override
  String toString() {
    return 'AdminDatabaseModel{id: $id, bookImage: $bookImage, bookName: $bookName, authorName: $authorName, bookQuantity: $bookQuantity, bookDescription: $bookDescription,bookCategory: $bookCategory, }';
  }
}
