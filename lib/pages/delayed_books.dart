import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/app_drawer.dart';
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart'; 

class DelayedBooksPage extends StatefulWidget {
  static const routeName = "delayed-books";
  const DelayedBooksPage({Key? key}) : super(key: key);

  @override
  State<DelayedBooksPage> createState() => _DelayedBooksPageState();
}

class _DelayedBooksPageState extends State<DelayedBooksPage> {

  
  @override
  Widget build(BuildContext context) {

    Provider.of<LibraryProvider>(context, listen: false).getAllDelayedMembers();

    return Scaffold(
      appBar: CustomAppbar("Delayed Books",context),
      drawer: AppDrawer(),

      body: Consumer<LibraryProvider>(

        builder: (context, provider,_) =>
            ListView.builder(

            itemCount: provider.delayedReaderList.length,
            itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                    child:Image.file(File(provider.delayedReaderList[index].readerImage), height: 50,width: 50,fit: BoxFit.cover,)),
              ),
              title: Text(provider.delayedReaderList[index].readerName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              subtitle: Text(provider.delayedReaderList[index].readerBookName, style: TextStyle(fontSize: 16),),
           trailing: Column(children: [
                      Text("Return Date:", style: TextStyle(color: Colors.purple),),
                      Text(provider.delayedReaderList[index].returnDate)

                    ],),
            ),
          );
        }),
      ),

    );
    
  }
}