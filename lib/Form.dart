

import 'dart:convert';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterapp_withmysqlphp/component/View_page.dart';
import 'package:flutterapp_withmysqlphp/component/button.dart';
import 'package:flutterapp_withmysqlphp/component/navigation.dart';
import 'package:flutterapp_withmysqlphp/component/textfield.dart';
import 'package:http/http.dart' as http;


class form_insert extends StatelessWidget {
   form_insert({super.key});
final name=TextEditingController();
final email=TextEditingController();
final password= TextEditingController();
  Future<void>insertrecord() async{

    if(name.text!=""|| email.text!=""||password.text!="" ){

      try {
        String uri="http://196.222.102.48/pratice_flutter_API/insert_record.php";

        var res = await http.post(Uri.parse(uri), body: {
          "name":name.text,
          "email":email.text,
          "password":password.text,
        });
        //var response=jsonDecode(res.body);
        var response=json.decode(res.body);

        if(response["success"]=="true"){
          print("Record Inserted");
          name.text="";
          email.text="";
          password.text="";

        }
        else{
          print("have issues");
        }
        
      }
      catch(e){
        print(e);

      }

    }
else {
  print("please fill all fileds");
    }
}



@override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: Center(
        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("INSERT  INTO  THE  DATABASE"),
              SizedBox(height: 50,),

              textfield(
                controller: name,
                  hintText: "Enter Name",
                  obscureText: false,),

              SizedBox(height: 10,),
              textfield(
                controller: email,
                hintText: "Enter the Email",
                obscureText: false,),
          SizedBox(height: 10,),
              textfield(
                controller: password,
                hintText: "Enter the Password",
                obscureText: false,),
          SizedBox(height: 10,),
              Buttons(onTap: insertrecord, ),
              navigation(),

            ],
          ),
        ),
      )),
    );
  }
}
