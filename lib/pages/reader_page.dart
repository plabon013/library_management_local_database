// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/library_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_appbar.dart';

class ReaderPage extends StatefulWidget {
  static const routeName = 'reader-page';
  const ReaderPage({Key? key}) : super(key: key);

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LibraryProvider>(context, listen: false).getAllReader();

    return Scaffold(
      appBar: CustomAppbar("Reader List", context),
      drawer:  AppDrawer(),
      body: Consumer<LibraryProvider>(
        builder: (context, provider, _) => ListView.builder(
            itemCount: provider.readerList.length,
            itemBuilder: (context, index) {
              final reader = provider.readerList[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                confirmDismiss: _showConformationDialog,
                onDismissed: (direction) {
                  provider.deleteReader(reader.id!);
                },
                key: ValueKey(reader.id),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          style: BorderStyle.solid,
                          color: provider.readerList[index].returnDate
                                      .compareTo(DateFormat("yyy/MM/dd")
                                          .format(DateTime.now())) <
                                  0
                              ? Colors.red
                              : provider.readerList[index].returnDate ==
                                      DateFormat("yyy/MM/dd")
                                          .format(DateTime.now())
                                  ? Colors.green
                                  : Colors.white,
                          width: 1)),
                  child: ListTile(
                  //  contentPadding: EdgeInsets.all(0),
                    leading: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(provider.readerList[index].readerImage),
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          )),
                    ),
                    title: Text(
                      provider.readerList[index].readerName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      provider.readerList[index].readerBookName,
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Column(children: [
                      Text("Return Date:", style: TextStyle(color: Colors.purple),),
                      Text(reader.returnDate)

                    ],),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<bool?> _showConformationDialog(DismissDirection direction) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete Reader"),
              content: Text("Are you sure delete this reader"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("No")),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Yes")),
              ],
            ));
  }
}
