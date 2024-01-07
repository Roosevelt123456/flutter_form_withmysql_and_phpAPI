

import 'package:flutter/material.dart';


class Buttons extends StatelessWidget {

 final Function()? onTap;


  const Buttons({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.black,
      borderRadius: BorderRadius.circular(10)
      ),
      child: ElevatedButton(
          onPressed: onTap,
          child: Center(
            child: Text("Insert", style: TextStyle( color: Colors.white24,
    fontSize: 16, fontWeight: FontWeight.bold
    ), ),
          )
    ),
    );
  }
}
