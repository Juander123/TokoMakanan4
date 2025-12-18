import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderPageProfile(),
            SizedBox(height: 20,),
            MainContentProfile( )
          ],
        ),
      ),
    );
  }
}

class HeaderPageProfile extends StatelessWidget {
  const HeaderPageProfile ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "Profil Saya",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          
          SizedBox(height: 20,),
          
          Container(
            
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrangeAccent,
                  radius: 30,
                  child: const Icon(Icons.person,color: Colors.white,size: 38,),
                ),

                SizedBox(width: 15,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(
                        "Djuanda Harianto",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      
                      SizedBox(height: 5,),

                      Text(
                        "DjuandaHarianto8@gmail.com",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),

                      SizedBox(height: 5,),

                      Text(
                        "+62895322782055",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),  
        ],
      ),
    );
  }
}

class MainContentProfile extends StatelessWidget{
  const MainContentProfile ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 5,offset: Offset(0, 5))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informasi Akun",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Metode Pembayaran",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),

            ],
          ),
        ),

        //Prefensi
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 5,offset: Offset(0, 5))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Preferensi Akun",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    "Notifikasi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bahasa",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tema",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),

            ],
          ),
        ),
        
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 5,offset: Offset(0, 5))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lainya",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    "Bantuan & Dukungan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tentang Aplikasi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kebijakan Privasi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(Icons.arrow_right)
                  ),
                ],
              ),

            ],
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10),

          child: ElevatedButton(
            
            style: ButtonStyle(

              backgroundColor: WidgetStatePropertyAll(Colors.deepOrange)
            ),
            child: Text(
              
              "Keluar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                
              ),
            ),
            onPressed: () {
            
            },
          ),
        ),
        
      ],
    );
  }
}