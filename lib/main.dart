import 'package:flutter/material.dart';
import 'package:library_manager/pages/about_library_page.dart';
import 'package:library_manager/pages/add_member.dart';
import 'package:library_manager/pages/add_new_book_page.dart';
import 'package:library_manager/pages/add_reader.dart';
import 'package:library_manager/pages/book_details.dart';
import 'package:library_manager/pages/check_valid_member_page.dart';
import 'package:library_manager/pages/dashbord_page.dart';
import 'package:library_manager/pages/delayed_books.dart';
import 'package:library_manager/pages/library_members.dart';
import 'package:library_manager/pages/login_page.dart';
import 'package:library_manager/pages/home_page.dart';
import 'package:library_manager/pages/launcher_page.dart';
import 'package:library_manager/pages/member_details_page.dart';
import 'package:library_manager/pages/reader_page.dart';
import 'package:library_manager/pages/sign_up_page.dart';
import 'package:library_manager/pages/splash_screen.dart';
import 'package:library_manager/pages/today_return_books.dart';  
import 'package:library_manager/pages/view_all_books.dart';
import 'package:library_manager/pages/view_all_category.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/bottom_nav_bar.dart';
 
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>LibraryProvider() .. getAllCSEBooks())
    ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Lato',
        
      ),
      initialRoute: SplashScreen.routeName,
      routes: {

        SplashScreen.routeName :(context) => const SplashScreen(),
        Launcher_page.routeName : (context)=> const Launcher_page(),
        LoginPage.routeName : (context) => const LoginPage(),
        SignUpPage.routeName :(context) => const SignUpPage(),
        BottomNavBar.routeName : (context) => const BottomNavBar(),
        HomePage.routeName :(context) => const HomePage(),
        ReaderPage.routeName : (context) => const ReaderPage(),
        DelayedBooksPage.routeName : (context) => const DelayedBooksPage(),
        DashbordPage.routeName : (context) => const DashbordPage(),
        AddNewBookPage.routeName : (context) => const AddNewBookPage(),
        LibraryMembers.routeName : (context) => const LibraryMembers(),
        ViewAllBooks.routeName : (context) => const ViewAllBooks(),
        BookDetails.routeName : (context) => const BookDetails(),
        AddMember.routeName : (context) => const AddMember(),
        CheckValidMemberPage.routeName :(context) => const CheckValidMemberPage(),
        AddReaderPage.routeName :(context) => const AddReaderPage(),
        TodayReturnBooks.routeName :(context) => const TodayReturnBooks(),
        MemberDetailsPage.routeName :(context) => const MemberDetailsPage(),
        AboutLibraryPage.routeName :(context) => const AboutLibraryPage(),
        ViewAllCategory.routeName :(context) => const ViewAllCategory(), 
         
        
        
      },
    );
  }
}
 