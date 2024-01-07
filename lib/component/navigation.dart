

import 'package:flutter/material.dart';
import 'package:flutterapp_withmysqlphp/component/View_page.dart';

class navigation extends StatelessWidget {
  const navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Builder(builder: (context){
        return ElevatedButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>viewpage()));
            }
            , child: Text("view Data"));
      }),
    );
  }
}
