import 'package:flutter/material.dart';
import 'package:flutterapp_withmysqlphp/Form.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
body:form_insert(),
      ),
    );
  }
}

