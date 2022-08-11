// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_manager/pages/home_page.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/bottom_nav_bar.dart';
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../models/book_model.dart';

class UpdateBookPage extends StatefulWidget {
   
  final BookModel book;
 
  const UpdateBookPage({Key? key, required this.book,}) : super(key: key);

  @override
  State<UpdateBookPage> createState() => _UpdateBookPageState();
}

class _UpdateBookPageState extends State<UpdateBookPage> {
  final bookNameController = TextEditingController();
  final authorNameController = TextEditingController();
  final bookQuantityController = TextEditingController();
  final discriptionController = TextEditingController();

  String? imagePatch;

  ImageSource source = ImageSource.camera;
  @override
  void dispose() {
    bookNameController.dispose();
    authorNameController.dispose();
    bookQuantityController.dispose();
    discriptionController.dispose();
    super.dispose();
  }

  String? bookCategory;
  

  @override
  void initState() {
    bookNameController.text = widget.book.bookName;
    authorNameController.text = widget.book.authorName;
    bookQuantityController.text =widget.book.bookQuantity.toString();
    discriptionController.text = widget.book.bookDescription;
 
    super.initState();
  }
 
  @override
  void didChangeDependencies() { 


    imagePatch = widget.book.bookImage;
    bookCategory = widget.book.bookCategory;
    super.didChangeDependencies();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

     
    return Scaffold(
        appBar: CustomAppbar("Update Book", context),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Center(
                    child: Image.file(
                      File( 
                       imagePatch.toString(),
                      ),
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: (MediaQuery.of(context).size.width / 2) - 70,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      elevation: 10,
                                      actions: [
                                        ListTile(
                                          onTap: () {
                                            source = ImageSource.camera;
                                            _getImage();
                                            Navigator.of(context).pop();
                                          },
                                          title: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.deepOrange,
                                          ),
                                          subtitle: Text(
                                            "Image from camera",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Divider(),
                                        ListTile(
                                          onTap: () {
                                            source = ImageSource.gallery;
                                            _getImage();
                                            Navigator.of(context).pop();
                                          },
                                          title: Icon(
                                            Icons.photo_library_outlined,
                                            color: Colors.deepOrange,
                                          ),
                                          subtitle: Text(
                                            "Image from Gallery",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                            size: 35,
                          )))
                ],
              ),
              SizedBox(
                height: 15,
              ),

              // todo This is bookname textField section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: bookNameController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.menu_book,
                      ),
                      hintText: "Enter the book name",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              // todo This is author name textField section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: authorNameController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.account_circle,
                      ),
                      hintText: "Enter the author name",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              // todo this is book quantity textField section
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: TextFormField(
                  controller: bookQuantityController ,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.compress_outlined,
                      ),
                      hintText: "Enter the book quantity",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              
              
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: TextFormField(
                  controller: discriptionController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.my_library_books_outlined,
                      ),
                      hintText: "Enter the book description",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Select category ->",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Consumer<LibraryProvider>(
                          builder: (context, provider, _) => 
                            DropdownButton(
                            borderRadius: BorderRadius.circular(20),
                            underline: Text(""),
                            dropdownColor: Colors.white,
                        
                            value:bookCategory,
                        
                        
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w500),
                            items: provider.category_items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() { 
                                bookCategory = newValue!;
                                
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: ElevatedButton(
                    onPressed: (){
                      _saveBook();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: Text(
                      "Update Book",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ],
          ),
        ));
  } 

   _getImage() async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      imagePatch = widget.book.bookImage;
    });
    if (pickedImage != null) {
      setState(() {
        imagePatch = pickedImage.path;
      });
    }
  }

  void _saveBook() async {
    if (formKey.currentState!.validate()) {
      final bookModel = BookModel(
          id: widget.book.id,
          bookImage: imagePatch.toString(),
          bookName: bookNameController.text,
          authorName: authorNameController.text,
          bookQuantity: int.parse(bookQuantityController.text),
          bookDescription: discriptionController.text,
          bookCategory: bookCategory!);

      Provider.of<LibraryProvider>(context, listen: false)
          .updateBooks(bookModel.id!, bookModel);

      Navigator.pushNamed(context, BottomNavBar.routeName);

      print(bookModel.toString());
    }
  }
}
