import 'package:flutter/cupertino.dart'; 
import 'package:library_manager/Database/book_db_helper.dart';
import 'package:library_manager/Database/member_db_helper.dart';
import 'package:library_manager/Database/reader_db_helper.dart';
import 'package:library_manager/models/admin_db_model.dart';
import 'package:library_manager/models/book_model.dart'; 
import 'package:library_manager/models/member_model.dart';
import 'package:library_manager/models/reader_model.dart';

import '../Database/admin_db_helper.dart';

class LibraryProvider extends ChangeNotifier {
  List<AdminDatabaseModel> adminList = [];
  List<BookModel> booksList = []; 
  List<MemberModel> memberList =[];
  List<ReaderModel> readerList =[];
  List<ReaderModel> delayedReaderList =[];
  List<ReaderModel> todayReturnBooksList =[];
  List<BookModel> cseBooksList = [];
  List<BookModel> eeeBooksList = [];
  List<BookModel> civilBooksList = [];
  List<BookModel> textileBooksList = [];
  List<BookModel> mecanicalBooksList = [];
  List<BookModel> storyBooksList = [];
  List<BookModel> historyBooksList = [];
  List<BookModel> poemBooksList = [];
  List<BookModel> islamicBooksList = [];
  List<BookModel> motivationalBooksList = [];
  List<BookModel> horrorBooksList = [];
  List<BookModel> othersBooksList = [];
  List<dynamic> listOfCategoryListBooks=[];
  List<dynamic> sameReaderBooks=[];
  var category_items = [

    'CSE',
    'EEE',
    'CIVIL',
    'TEXTILE',
    'MECHANICAL',
    'STORY',
    'HISTORY',
    'POEM',
    'ISLAMIC',
    'MOTIVATIONAL',
    'HORROR',
    'OTHERS',
  ];


 

  Future<bool> addNewAdmin(AdminDatabaseModel adminDatabaseModel) async {
    final rowId = await AdminDBHelper.insertAdmin(adminDatabaseModel);
    if (rowId > 0) {
      adminDatabaseModel.id = rowId;
      adminList.add(adminDatabaseModel);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> addNewBook(BookModel bookModel) async {
    final rowId = await BookDBHelper.insertBook(bookModel);
    if (rowId > 0) {
      bookModel.id = rowId;
      booksList.add(bookModel);
      notifyListeners();
      return true;
    }
    return false;
  }
    Future<bool> addNewMember(MemberModel memberModel) async {
    final rowId = await MemberDBHelper.insertMember(memberModel);
    if (rowId > 0) {
      memberModel.id = rowId;
      memberList.add(memberModel);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> addNewReader(ReaderModel readerModel) async {
    final rowId = await ReaderDBHelper.insertReader(readerModel);
    if (rowId > 0) {
      readerModel.id = rowId;
      readerList.add(readerModel);
      notifyListeners();
      return true;
    }
    return false;
  }

  updateBooks(int id,BookModel bookModel,){
    BookDBHelper.updateBook(id,bookModel.bookImage,bookModel.bookName, bookModel.authorName, bookModel.bookQuantity, bookModel.bookDescription, bookModel.bookCategory ).then((value) {
     
      notifyListeners();
    });

  }
   Future<BookModel> getContactById(int id) => BookDBHelper.getBooksById(id);




  Future<AdminDatabaseModel> getValidAdmin(String adminEmail) {
    return AdminDBHelper.getValidAdminInfo(adminEmail);
  }

  Future<MemberModel> getValidMember(String adminEmail) {
    return MemberDBHelper.getValidMemberInfo(adminEmail);
  }


  getAllDelayedMembers(){
    ReaderDBHelper.getAllDelayedReader().then((value) {
      delayedReaderList = value;
      notifyListeners();

    });
  }

  getAllAdmin(){
    return AdminDBHelper.getAdmin();
  }

  getSameBook(String bookName){
    ReaderDBHelper.getSameNameOfBook(bookName).then((value) {
      sameReaderBooks = value;
      notifyListeners();
    });
  }


getTodayReturnBooks(){
    ReaderDBHelper.getTodayReturnBooks().then((value) {
      todayReturnBooksList = value;
      notifyListeners();

    });
  }
  getAllMembers(){
    MemberDBHelper.getAllMembers().then((value) {
      memberList = value;
      notifyListeners();

    });
  }
   getAllReader(){
    ReaderDBHelper.getAllReader().then((value) {
      readerList = value;
      notifyListeners();

    });
  }
  
  getAllBooks(){
    BookDBHelper.getAllBooks().then((value) {
      booksList = value;
      notifyListeners();

    });
  }

    deleteReader(int id) async{
    final rowID = await ReaderDBHelper.deleteReader(id);
    if(rowID > 0){
      readerList.removeWhere((element) => element.id==id);
      notifyListeners();
    }
  }


    getAllCSEBooks(){
    BookDBHelper.getSingleCategoryBooks("CSE").then((value) {
      cseBooksList = value;
      listOfCategoryListBooks.insert(0, cseBooksList);
      notifyListeners();

    });
  }
  
  getAllEEEBooks(){
    BookDBHelper.getSingleCategoryBooks("EEE").then((value) {
      eeeBooksList = value;
      
      listOfCategoryListBooks.insert(1, eeeBooksList);
      notifyListeners();

    });
  }
  getAllCIVILBooks(){
    BookDBHelper.getSingleCategoryBooks("CIVIL").then((value) {
      civilBooksList = value;
      listOfCategoryListBooks.insert(2, civilBooksList);
      notifyListeners();

    });
  }
   getAllTEXTILEBooks(){
    BookDBHelper.getSingleCategoryBooks("TEXTILE").then((value) {
      textileBooksList = value;
      
      listOfCategoryListBooks.insert(3, textileBooksList);
      notifyListeners();

    });
  }
   getAllMECHANICALBooks(){
    BookDBHelper.getSingleCategoryBooks("MECHANICAL").then((value) {
      mecanicalBooksList= value;
      
      listOfCategoryListBooks.insert(4, mecanicalBooksList);
      notifyListeners();

    });
  }
     getAllSTORYBooks(){
    BookDBHelper.getSingleCategoryBooks("STORY").then((value) {
      storyBooksList= value;
      
      listOfCategoryListBooks.insert(5, storyBooksList);
      notifyListeners();

    });
  }
     getAllHISTORYBooks(){
    BookDBHelper.getSingleCategoryBooks("HISTORY").then((value) {
      historyBooksList= value;
      
      listOfCategoryListBooks.insert(6, historyBooksList);
      notifyListeners();

    });
  }
   getAllPOEMBooks(){
    BookDBHelper.getSingleCategoryBooks("POEM").then((value) {
      poemBooksList= value;
      
      listOfCategoryListBooks.insert(7, poemBooksList);
      notifyListeners();

    });
  }
     getAllISLAMICBooks(){
    BookDBHelper.getSingleCategoryBooks("ISLAMIC").then((value) {
      islamicBooksList=value;
      
      listOfCategoryListBooks.insert(8, islamicBooksList);
      notifyListeners();

    });
  }
     getAllMOTIVATIONALBooks(){
    BookDBHelper.getSingleCategoryBooks("MOTIVATIONAL").then((value) {
      motivationalBooksList=value;
      
      listOfCategoryListBooks.insert(9, motivationalBooksList);
      notifyListeners();

    });
  }
    getAllHORRORBooks(){
    BookDBHelper.getSingleCategoryBooks("HORROR").then((value) {
      horrorBooksList=value;
      
      listOfCategoryListBooks.insert(10, horrorBooksList);
      notifyListeners();

    });
  }
     getAllOTHERSBooks(){
    BookDBHelper.getSingleCategoryBooks("OTHERS").then((value) {
      othersBooksList=value;
      
      listOfCategoryListBooks.insert(11, othersBooksList);
      notifyListeners();

    });
  }
}
