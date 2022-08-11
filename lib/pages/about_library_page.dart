import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_manager/widgets/custom_appbar.dart';

class AboutLibraryPage extends StatefulWidget {
  static const routeName = "about-library";
  const AboutLibraryPage({Key? key}) : super(key: key);

  @override
  State<AboutLibraryPage> createState() => _AboutLibraryPageState();
}

class _AboutLibraryPageState extends State<AboutLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("About Library", context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:ListView(
          children: [
            SizedBox(height: 10,),
             Text(
            '''The library began in 1921 with 877 students, 60 teachers of 12 departments under three faculties art, science and law. Then the library was placed in the premises of Dhaka Medical College and Hospital and later it was transferred in the ground floor of a building situated at the north bank of the pond of Curzon Hall premises. Later, the library was transferred inro the present Central Library Building. The former principal of Dhaka College was the first librarian of the Dhaka University Library.

There are 4 reading rooms in the first floor of the Science Building. About 400 students can read at a time. The reading rooms are air-conditioned. There is also a reference room in the first floor. Teachers, researchers and students can use these and reference tools here. There are separate seating arrangements for teachers. Teachers, researchers, registered graduates, officers and employees can issue 10 books, 3 books for 14 days.

A complaint box is kept in every floor of the Main building and Science Building for readers. They can lodge any complaint in the box to redress the grievances. Those boxes are opened every week and necessary action taken accordingly. Besides, there is a senior officer in every floor who acts as a floor in charge. Readers can inform him about any sorts of problems for early solution. If he fails, readers can ventilate the same to the librarian for taking necessary action.
The library has now 621,058 volume of books and bound journals. Moreover, it has over 30,000 rare and old manuscripts, numerous microfilms and microfiches. The collection of this institution is increasing gradually day by day. 3,188 books were received as donation and 187 titles of journals are added 2007-2008 alone. An amount of Tk. 9.9 million was allocated in the budget for procurement of books and journals in that academic year. The budget is obtained every year from the govt of Bangladesh through the UGC. Nevertheless, it may be pointed out here that necessary books and journals cannot be procured as per the requirements of the various departments due to the paucity of funds.''', textAlign: TextAlign.justify,),
      
          ],
        )),
    );
  }
}
