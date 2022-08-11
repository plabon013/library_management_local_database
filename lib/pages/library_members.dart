// ignore_for_file: prefer_const_constructors
 
import 'dart:io';
 
import 'package:flutter/material.dart';
import 'package:library_manager/pages/member_details_page.dart';
import 'package:library_manager/providers/library_provider.dart';
import 'package:library_manager/widgets/app_drawer.dart';
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LibraryMembers extends StatefulWidget {
  static const routeName = "library-member";
  const LibraryMembers({Key? key}) : super(key: key);

  @override
  State<LibraryMembers> createState() => _LibraryMembersState();
}

class _LibraryMembersState extends State<LibraryMembers> {



  @override
  Widget build(BuildContext context) {

    Provider.of<LibraryProvider>(context,listen: false).getAllMembers();
    return Scaffold(
      appBar: CustomAppbar("Library Members",context),
      drawer: AppDrawer(),
      body: 

  Consumer<LibraryProvider>(
          builder: (context, provider, _) => ListView.builder(
            itemBuilder: (context, index) {
              final member = provider.memberList[index];
              return Card(
                child: ExpansionPanelList.radio(
            
                  children: [
                    ExpansionPanelRadio(
                        
                        value: member.id!,
                        headerBuilder: (context, isExpanded) => ListTile(
                          onTap: (){
                            Navigator.pushNamed(context, MemberDetailsPage.routeName, arguments: member);
                          },
                          title: Text(member.memberName),
                                  leading: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                      child:  Image.file(File(member.memberImage), height: 50,width: 50,fit: BoxFit.cover,)),
                ),
                          
                        
                            ),
                        body:  Column(
                          children: [ 
                             ListTile(
                              
                                 tileColor: Color(0xfff2f2f2),
                              contentPadding: EdgeInsets.all(0),
                              leading: Text(""),
                title: Text(
                  member.memberPhone,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 1),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          _makePhoneCall(member.memberPhone);
                        },
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black87,
                        )),
                    IconButton(
                        onPressed: (){
                          _makeMesage(member.memberPhone);
                        },
                        icon: Icon(
                          Icons.message,
                          color: Colors.black87,
                        )),
                  ],
                ),
                          ), 
                          Divider(
                            height: 1,
                            color: Colors.white,
                          ),
                            
                              ListTile(
                                 tileColor: Color(0xfff2f2f2),
                                contentPadding: EdgeInsets.all(0),
                              leading: Text(""),
                title: Text(
                  member.memberEmail,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 1),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          _makeEmail(member.memberEmail);
                        },
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.black87,
                        )),
                   
                  ],
                ),
                          ),
                      
                      
                          ],
                        )
                        )
                  ],
                ),
              );
            },
            
            itemCount: provider.memberList.length,
          ),
        )

     
    );
  }

   void _makePhoneCall(String phone) async {
    final url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }

  void _makeEmail(String email) async {
    final url = Uri(scheme: 'mailto', path: email);
    if (url != null) {
      await launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }

  void _makeMesage(String phone) async {
    final url = Uri(scheme: 'sms', path: phone);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Something wrong";
    }
  }
}
