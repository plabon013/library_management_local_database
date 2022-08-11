// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_manager/models/member_model.dart';
import 'package:library_manager/widgets/custom_appbar.dart';

class MemberDetailsPage extends StatefulWidget {
  static const routeName = "member-details";
  const MemberDetailsPage({Key? key}) : super(key: key);

  @override
  State<MemberDetailsPage> createState() => _MemberDetailsPageState();
}

class _MemberDetailsPageState extends State<MemberDetailsPage> {
  MemberModel? member;

  @override
  void didChangeDependencies() {
    member = ModalRoute.of(context)!.settings.arguments as MemberModel;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Member Details", context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: Colors.purple),
              ),
              Container(
                height: 10,
                width: double.infinity,
              ),
              Positioned(
                top: 20,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      File(member!.memberImage),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    )),
              ),
            
          Positioned(
            bottom: -200,
            child: Card(
              elevation: 4,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 250,
                width: MediaQuery.of(context).size.width-50,
                decoration: BoxDecoration(color: Colors.white),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(member!.memberName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 1,wordSpacing:1),),
                   SizedBox(height: 10,),
                    Text("Mobile: ${member!.memberPhone}"),
                     SizedBox(height: 3,),
                    Text("Email: ${member!.memberEmail}"),
                     SizedBox(height: 3,),
                    Text("Dept: ${member!.memberDept}"),
                     SizedBox(height: 3,),
                    Text("Address: ${member!.memberAddress}"),
                  ],
                ),
              ),
            ),
          )

               
            ],
          ),
        
           
        ],
      ),
    );
  }
}
