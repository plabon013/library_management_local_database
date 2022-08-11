 

import 'package:flutter/material.dart';
import 'package:library_manager/models/book_model.dart';

import 'book_item.dart';
import 'category_header.dart';

class HomeCategoryBooks extends StatelessWidget {
  final String title;
  final List<BookModel> bookList;
  const HomeCategoryBooks({Key? key, required this.title, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                    children: [
                      Divider(),

                      CategoryHeader(
                        title: title,
                        bookList: bookList,
                      ),

                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bookList.length,
                            itemBuilder: (context, index) => BookItem(
                                  bookItem: bookList[index],
                                  bookList: bookList, 
                                )),
                      ),
                    ],
                  );
    
  }
}