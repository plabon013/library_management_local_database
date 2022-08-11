import 'package:flutter/material.dart';
import 'package:library_manager/models/book_model.dart';
import 'package:library_manager/pages/book_details.dart'; 

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
 
  final List<BookModel> bookList;

  CustomSearchDelegate(this.bookList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';

          close(context, null);
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<BookModel> matchQuery = [];
    for (var fruit in bookList) {
      if (fruit.bookName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: bookList.length,
      itemBuilder: (context, index) {
        var result = bookList[index];
        return ListTile(
          
           onTap: (){
            Navigator.pushNamed(context, BookDetails.routeName, arguments: [result,bookList]
            );
          },
          title: Text(result.bookName),
        );
      },
    );
  }

    @override
  String get searchFieldLabel => 'Search Book Name';

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<BookModel> matchQuery = [];
    for (var fruit in bookList) {
      if ((fruit.bookName).toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
       
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, BookDetails.routeName, arguments: [result,matchQuery]);
          },
          title: Text(result.bookName),
        );
      },
    );
  }
}
