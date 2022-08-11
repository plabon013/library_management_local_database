 
import 'package:flutter/material.dart';
import 'package:library_manager/models/book_model.dart';
import 'package:library_manager/widgets/custom_appbar.dart';

import '../widgets/book_item.dart';

class ViewAllBooks extends StatefulWidget {
  static const routeName ="view-all-books";
  const ViewAllBooks({Key? key}) : super(key: key);

  @override
  State<ViewAllBooks> createState() => _ViewAllBooksState();
}

class _ViewAllBooksState extends State<ViewAllBooks> {

  List<BookModel>? bookList;
  List? items;
  @override
  void didChangeDependencies() {

    items = ModalRoute.of(context)!.settings.arguments as List;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(items![1].toString(),context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(

            itemCount: items![0].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 5 / 9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) => BookItem(bookItem:  items![0]![index],bookList:  items![0]! )),
      ),

    );
  }
}
