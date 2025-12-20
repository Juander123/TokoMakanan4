import 'package:flutter/material.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.white),
        
        title: Text(
          "Tentang Aplikasi",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
          child: Text(
            "Copyright By Djuanda Harianto"
          ),
        ),
    );
  }
}