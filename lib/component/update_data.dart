

import 'dart:convert';

import 'package:http/http.dart' as htt;

import 'package:flutter/material.dart';
import 'package:flutterapp_withmysqlphp/component/textfield.dart';

class update_data extends StatefulWidget {
  String name;
  String email;
  String password;
  update_data( this.password, this.email, this.name);


  @override
  State<update_data> createState() => _update_dataState();
}





class _update_dataState extends State<update_data> {

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  Future<void>updaterecord() async{

    try{
String uri="http://196.222.102.48/pratice_flutter_API/updata_record.php";

var res= await htt.post(Uri.parse(uri),body: {

"name":name.text,
"email":email.text,
"password":password.text,
});
var response=jsonDecode(res.body);
if(response["sucess"]=="true"){

print("updated");
}
else{
  print("failed");
}

    }
    catch(e){
      print(e);

    }


  }

  @override
  void initState() {
    name.text=widget.name;
    email.text=widget.email;
    password.text=widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            textfield(
                hintText: "update name",
                controller: name,
                obscureText: false),

            textfield(hintText: "update email",
                controller: email,
                obscureText: false),

            textfield(hintText: "update Password",
                controller: password,
                obscureText: false),

            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (){
                updaterecord();

              },
                  child: Text("update")),
            )
          ],
        ),

    );
  }
}
