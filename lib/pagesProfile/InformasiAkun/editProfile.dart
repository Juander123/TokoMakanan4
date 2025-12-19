import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget{
  const EditProfile ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: IconThemeData(color: Colors.white),
        
        title: Text(
          "Edit Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      

      body: SingleChildScrollView(  
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,  
          
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 5),
                    blurRadius: 8
                  ),
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  CircleAvatar(  
                    backgroundColor: Colors.white,  
                    radius: 50,
                    child:Icon(Icons.person, size: 80,color: Colors.grey,), 
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit,color: Colors.white,),
                      SizedBox(width: 5,),
                      Text(
                        "Edit Foto Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing:2,
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                ],
              ), 
            ),

            Text(
              textAlign: TextAlign.center,
              "Akan Dikembangkan Lebih Lanjut lagi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            )
          ],
        ),
      ),
    );
  }
}