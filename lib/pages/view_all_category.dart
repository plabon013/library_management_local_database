import 'package:flutter/material.dart';
import 'package:library_manager/pages/view_all_books.dart'; 
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../providers/library_provider.dart';

class ViewAllCategory extends StatefulWidget {
  static const routeName = "view-all-category";
  const ViewAllCategory({Key? key}) : super(key: key);

  @override
  State<ViewAllCategory> createState() => _ViewAllCategoryState();
}

class _ViewAllCategoryState extends State<ViewAllCategory> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppbar("All Category", context),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: category_items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(7),
        
        height: 75,
        width: 78,
        child: Consumer<LibraryProvider>(
          builder: (context, provider, _) => 
            InkWell(
            onTap: (){

            Navigator.pushNamed(context, ViewAllBooks.routeName, arguments: [provider.listOfCategoryListBooks[index],category_items[index]]);
              
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
          
              child: FittedBox(child: Text(category_items[index],textAlign: TextAlign.center, style: TextStyle(fontSize: 12),)),
              
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(60),
                 color: Color(0xfff2f2f2)
          
              ),
          
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple.withOpacity(0.5),width: 1),
          borderRadius: BorderRadius.circular(60)
        ),
    )),
      ),
    );
    
  }
}