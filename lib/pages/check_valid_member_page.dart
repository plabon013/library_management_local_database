// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:library_manager/pages/add_reader.dart';
import 'package:library_manager/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../providers/library_provider.dart'; 

class CheckValidMemberPage extends StatefulWidget {
  static const routeName ="check-valid-members-page";
  const CheckValidMemberPage({Key? key}) : super(key: key);

  @override
  State<CheckValidMemberPage> createState() => _CheckValidMemberPageState();
}
 
class _CheckValidMemberPageState extends State<CheckValidMemberPage> {
   final emailController = TextEditingController(); 

  final formKey = GlobalKey<FormState>();
  String _errorText="";



  @override
  void dispose() {
    emailController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar("Verify Member",context),
      body: SafeArea(
        child: Form(
            key: formKey,
            child: ListView(
              children: [

                SizedBox(height: 80,),
            
               
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/login.png",
                  height: 220,
                  width: 220,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 20,
                ), 
         
                // todo This is email textField section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    
                    controller: emailController,
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w500),
                    decoration: InputDecoration( 
                      errorText: _errorText,
                        filled: true, 
                        fillColor: Color(0xffe6e6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        hintText: "Enter your email",
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
                        "Find Member",
                        style: TextStyle(fontSize: 16),
                      )),
                ),

                 
              ],
            )),
      ),
    );
  }

void _chechValidet() async{
    if (formKey.currentState!.validate()) {
     final model = await Provider.of<LibraryProvider>(context, listen: false).getValidMember(emailController.text);
    

      if (model.memberEmail == emailController.text) {
         
         Navigator.pushReplacementNamed(context, AddReaderPage.routeName, arguments: model);
      }
      else{
        setState(() {
          _errorText = "Invalid email! This person is not member in library";

        });
      }
     
    

     
    }
  }
}

  
