

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_withmysqlphp/component/update_data.dart';
import 'package:http/http.dart' as http;

class viewpage extends StatefulWidget {
   viewpage({super.key});

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  List userdata=[];
  Future<void> deleterecord(String id) async{
try{
  String uri="http://196.222.102.48/pratice_flutter_API/deleterecord.php";
var res=await http.post(Uri.parse(uri),body: {
  "id":id
} );
var response=jsonDecode(res.body);
if(response["success"]=="true"){
  print("record deleted");
  getrecord();

} else{
  print("some issues");
}
}
catch(e){
  print(e);
}
  }


  Future<void>getrecord() async{
    String uri="http://196.222.102.48/pratice_flutter_API/view_data.php";

    try{
      var reponse=await http.get(Uri.parse(uri));

      setState(() {
        userdata=jsonDecode(reponse.body);

      });

    }
    catch(e){
print(e);
    }

  }
 @override
  void initState() {
    getrecord();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("View Data"),
      ),
      body: ListView.builder(itemCount: userdata.length,
        itemBuilder: (
            BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(10),
          
          child: ListTile(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
                update_data(
                  userdata[index]["uname"],
                  userdata[index]["uemail"],
                  userdata[index]["upassword"],)));
          },
            leading: Icon(CupertinoIcons.heart,
            color: Colors.grey.shade600,),

            title: Text(userdata[index]["uname"]),
            subtitle: Text(userdata[index]["uemail"]),
            trailing:IconButton(icon: Icon(Icons.delete),
              onPressed: () {
                deleterecord(userdata[index]["uid"]);
              },

                ),

          ),
        );

        },),
    );
  }
}
