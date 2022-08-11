// ignore_for_file: prefer_const_constructors, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_manager/models/member_model.dart';
import 'package:library_manager/models/reader_model.dart';
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/library_provider.dart';

class AddReaderPage extends StatefulWidget {
  static const routeName = 'add-reader-page';
  const AddReaderPage({Key? key}) : super(key: key);

  @override
  State<AddReaderPage> createState() => _AddReaderPageState();
}

class _AddReaderPageState extends State<AddReaderPage> {
  
   final nameController = TextEditingController(); 

  final formKey = GlobalKey<FormState>();
  String? _giveDate;
  String? _ReturnDate;


  @override
  void dispose() {
    nameController.dispose(); 
    super.dispose();
  }
  MemberModel? member;
  @override
  void didChangeDependencies() {
    member = ModalRoute.of(context)!.settings.arguments as MemberModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Add Reader", context),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:   Image.file(
                File(member!.memberImage),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
              
              ),
          SizedBox(
            height: 5,
          ),
          Text(
            member!.memberName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1,
                wordSpacing: 1),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Email: ${member!.memberEmail}",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Phone: ${member!.memberPhone}",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Address: ${member!.memberAddress}",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Dept: ${member!.memberDept}",
            style: TextStyle(color: Colors.grey),
          ),

          Expanded(
            child: Form(
              key: formKey,
              child: ListView(
              children: [
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                      controller: nameController,
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                      decoration: InputDecoration( 
                          filled: true, 
                          fillColor: Color(0xffe6e6e6),
                          contentPadding: EdgeInsets.only(left: 10),
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.menu_book_outlined,
                          ),
                          hintText: "Enter the book name",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }  else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20,),



                   Row(
                     children: [
                       Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Give Date",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                _giveDate == null
                                    ? "No date choisen!"
                                    : _giveDate.toString(),
                                style: TextStyle(
                                    color: _giveDate == null
                                        ? Colors.grey
                                        : Colors.red),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              OutlinedButton(
                                  onPressed: _showGiveDatePicker,
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.purple),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20))),
                                  child: Text("Select Give Date"))
                            ],
                          )),
                    
                       Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Return Date",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                _ReturnDate == null
                                    ? "No date choisen!"
                                    : _ReturnDate.toString(),
                                style: TextStyle(
                                    color: _ReturnDate == null
                                        ? Colors.grey
                                        : Colors.red),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              OutlinedButton(
                                  onPressed: _showReturnDatePicker,
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.purple),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20))),
                                  child: Text("Select Return Date"))
                            ],
                          )),


                    
                     ],
                   ),


                   Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: ElevatedButton(
                      onPressed: _chechValidet,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      child: Text(
                        " Save",
                        style: TextStyle(fontSize: 16),
                      )),
                ),

          
          
          
          
              ],
            )),
          )



        ]),
      ),
    );
  }
   void _showGiveDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (selectedDate != null) {
      setState(() {
        _giveDate = DateFormat("yyy/MM/dd").format(selectedDate);
      });
    }
  }
   void _showReturnDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1971),
        lastDate: DateTime(2030));

    if (selectedDate != null) {
      setState(() {
        _ReturnDate = DateFormat("yyy/MM/dd").format(selectedDate);
      });
    }
  }

  void _chechValidet() async {

    if(formKey.currentState!.validate()){


      final readerModel = ReaderModel(
          readerImage: member!.memberImage as String,
          readerName: member!.memberName,
          readerEmail: member!.memberEmail,
          readerPhone: member!.memberPhone,
          readerAddress: member!.memberAddress,
          readerDept: member!.memberDept,
          readerBookName: nameController.text,
          giveDate: _giveDate.toString(),
        returnDate: _ReturnDate.toString()
      );

      final status = await  Provider.of<LibraryProvider>(context,listen: false).addNewReader(readerModel);
      if(status){

        Navigator.pop(context);
        print(readerModel.toString());

      }

    }

  }
}
