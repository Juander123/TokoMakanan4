import 'package:flutter/material.dart';

enum LocationType {
  home,
  office;

  String get label {
    switch  (this){
      case LocationType.home:
      return "Rumah";
      case LocationType.office:
      return "kantor";
    }
  }
  Color get color {
    switch (this){
      case  LocationType.home:
      return  Colors.deepOrangeAccent;
      case  LocationType.office:
      return Colors.grey;
    }
  }
}

class AddressModel {
  final String id;
  final String receipientNamme;
  final String phoneNumber;
  final String fullAddress;
  final LocationType  type;
  bool  isSelected;

  AddressModel ({
    required this.fullAddress,
    required this.isSelected,
    required this.id,
    required this.phoneNumber,
    required this.receipientNamme,
    required this.type,
  });

}


class ChekoutPage extends StatefulWidget{
  const ChekoutPage({super.key});
  
  @override
  State<ChekoutPage> createState() => _ChekoutPageState();
}

class _ChekoutPageState extends State<ChekoutPage> {


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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black,blurRadius: 10,offset: Offset(0, 5)),
                ]
              ),

              


            )
          ],
        ),
      )
      
    );
  }
}


