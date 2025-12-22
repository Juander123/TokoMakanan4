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


class AdressCard {
  final String nama;
  final String tempat;
  final String noHp;
  final String Alamat;

  const AdressCard({
    required this.nama,
    required this.Alamat,
    required this.noHp,
    required this.tempat,


  });
}


class AdreesChekout extends StatefulWidget{

  final AdressCard Adress; 

  const AdreesChekout ({super.key,required this.Adress});

  @override
  State<AdreesChekout> createState() => _AdreesChekoutState();
}

class _AdreesChekoutState extends State<AdreesChekout> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5), 
          )
        ]
      ),

      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.pin_drop_outlined,color: Colors.deepOrangeAccent,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Alamat Pengiriman",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),

                    Text(
                      "Ubah",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),

          Container(
            
          ),
        ],
      ),
    );
  }
}
