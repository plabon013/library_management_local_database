import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class TodayReturnBooks extends StatefulWidget {
  static const routeName = "today-return-books";
  const TodayReturnBooks({Key? key}) : super(key: key);

  @override
  State<TodayReturnBooks> createState() => _TodayReturnBooksState();
}

class _TodayReturnBooksState extends State<TodayReturnBooks> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LibraryProvider>(context, listen: false).getTodayReturnBooks();
    return Scaffold(
      appBar: CustomAppbar("Today Return Books", context),
      body: Consumer<LibraryProvider>(
        builder: (context, provider, _) => ListView.builder(
            itemCount: provider.todayReturnBooksList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          File(provider.todayReturnBooksList[index].readerImage),
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )),
                  ),
                  title: Text(
                    provider.todayReturnBooksList[index].readerName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    provider.todayReturnBooksList[index].readerBookName,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
