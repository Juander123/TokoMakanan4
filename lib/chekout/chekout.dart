import 'package:flutter/material.dart';

class Chekout extends StatefulWidget{
  const Chekout({super.key});
  
  @override
  State<Chekout> createState() => _ChekoutState();
}

class _ChekoutState extends State<Chekout> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          "Haalaman Pembayaran",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        
      ),
      
      

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20 ),
        child: Column(
        
          children: [
            
          ],
        ),
      )
      
    );
  }
}

class AdreesChekoout extends StatelessWidget{

  const AdreesChekoout ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      
    );
  }
}
