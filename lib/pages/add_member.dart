// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_manager/providers/library_provider.dart'; 
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../models/member_model.dart';

class AddMember extends StatefulWidget {
  static const routeName = "add-member";
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
   final memberNameController = TextEditingController();
  final memberEmailController = TextEditingController();
  final memberPhoneController = TextEditingController();
  final addressController = TextEditingController();

  String? imagePatch;

  ImageSource source = ImageSource.camera;
  @override
  void dispose() {
    memberNameController.dispose();
    memberEmailController.dispose();
    memberPhoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  String deptCategory = 'No department choicen';
  var category_items = [

    'CSE',
    'EEE',
    "CIVIL",
    'MECHANICAL',
    'TEXTILE',
    "No department choicen"
    
  ];
  String _errorMessage = "";

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar("Add New Member",context),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Center(
                    child: imagePatch == null
                        ? Image.asset(
                            "assets/images/man.png",
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(
                              imagePatch!,
                            ),
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: (MediaQuery.of(context).size.width / 2) - 70,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      elevation: 10,
                                      actions: [
                                        ListTile(
                                          onTap: () {
                                            source = ImageSource.camera;
                                            _getImage();
                                            Navigator.of(context).pop();
                                          },
                                          title: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.deepOrange,
                                          ),
                                          subtitle: Text(
                                            "Image from camera",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Divider(),
                                        ListTile(
                                          onTap: () {
                                            source = ImageSource.gallery;
                                            _getImage();
                                            Navigator.of(context).pop();
                                          },
                                          title: Icon(
                                            Icons.photo_library_outlined,
                                            color: Colors.deepOrange,
                                          ),
                                          subtitle: Text(
                                            "Image from Gallery",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                            size: 35,
                          )))
                ],
              ),
              SizedBox(
                height: 15,
              ),

              // todo This is memberName textField section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: memberNameController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.account_circle,
                      ),
                      hintText: "Enter the member name",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              // todo This is member email textField section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: memberEmailController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      hintText: "Enter the member email",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              // todo this is member phone textField section
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: TextFormField(
                  controller: memberPhoneController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.phone
                      ),
                      hintText: "Enter the phone numbers",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
             
              // todo this is member address textField section
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: TextFormField(
                  controller: addressController,
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple.withOpacity(0.1),
                      contentPadding: EdgeInsets.only(left: 10),
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.location_on,
                      ),
                      hintText: "Enter the member address",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Expanded(child: Container(
                      alignment: Alignment.center,
                      height: 50,
                        decoration: BoxDecoration(

                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Text("Select category ->", textAlign: TextAlign.center,style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 16),))),

                  SizedBox(width: 10,),
                    Expanded(
                      child: Container( 
                        height: 50, 
                        alignment: Alignment.center,
                        decoration: BoxDecoration(

                          color: Colors.purple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(20),
                          underline: Text(""),
                          dropdownColor: Colors.white,



                          value: deptCategory,

                          icon: const Icon(Icons.keyboard_arrow_down),
                          
                          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),
                          items: category_items.map((String items) {
                            return DropdownMenuItem(
                              value: items,

                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              deptCategory = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Text(_errorMessage, textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: ElevatedButton(
                    onPressed: _addMember,
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                    child: Text(
                      "Add Member",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ],
          ),
        ));
  }

  void _getImage() async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imagePatch = pickedImage.path;
      });
    }
  }
  
  void _addMember() async {
      if(formKey.currentState!.validate() && imagePatch != null){

        final memberModel = MemberModel(
           memberImage: imagePatch.toString(),
           memberName: memberNameController.text,
           memberEmail: memberEmailController.text,
           memberPhone: memberPhoneController.text,
           memberAddress: addressController.text,
           memberDept: deptCategory
        );

       final status = await  Provider.of<LibraryProvider>(context,listen: false).addNewMember(memberModel);
        if(status){

          Navigator.pop(context);
          print(memberModel.toString());

        }

      }
      else{
        setState(() {
          _errorMessage = "No image choisen!!";
        });
      }
  }


  }
