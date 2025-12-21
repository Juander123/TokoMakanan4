import 'package:flutter/material.dart';

class Chekout extends StatelessWidget{
  const Chekout({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Pembayaran"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text("LAnjutkan Pembayaran"),
        ),
      ),
    );
  }

}