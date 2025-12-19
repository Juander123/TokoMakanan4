import 'package:flutter/material.dart';

import 'pages/beranda.dart';
import 'pages/profile.dart';
import 'pages/transaksi.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build

    return MaterialApp(
      title: "TokoMakanan4",
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget{
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirsScreen(

    );
  }    
}

class _FirsScreen extends State<FirstScreen>{
  
  int _selectedIndex = 0;

  static const List<Widget> _WidgetOption = <Widget>[
    HomePage(),
    Transaksipage(),
    ProfilePage(),  
  ];

  void _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: _WidgetOption.elementAt(_selectedIndex), 

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5)

            ),
          ],
        ),

        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_outlined),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              activeIcon: Icon(Icons.receipt_long_outlined),
              label: "Transaksi"
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person_outline),
              label: "Profile"
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: _onTapped,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

