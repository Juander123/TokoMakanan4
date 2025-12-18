import 'package:flutter/material.dart';

class Transaksipage extends StatefulWidget{
  const Transaksipage ({super.key});

  @override
  State<Transaksipage> createState() => _TransaksipageState();
}

class _TransaksipageState extends State<Transaksipage> {
  
  int _QuerySelectedStatus = 0;
  
  final List<String> _CategoryStatus = ["Semua","Berhasil","Dibatalkan"]; 

  final List<TransactionModel> _TransactionList = [
    TransactionModel(
      Harga: "Rp 30000", 
      Menu: "Mie Goreng, Teh", 
      NoResi: "#0001", 
      TotalPembayaran: "Total Pembayaran", 
      StatusPesanan: "Selesai", 
      Waktu: "10 - December - 2025",
    ),
    TransactionModel(
      Harga: "Rp 80000", 
      Menu: "Mie Goreng, Teh,Jus,Bakso", 
      NoResi: "#0002", 
      TotalPembayaran: "Total Pembayaran", 
      StatusPesanan: "Selesai", 
      Waktu: "10 - December - 2025"
    ),
    TransactionModel(
      Harga: "Rp 75000", 
      Menu: "Mie Goreng, Teh,Jus,Bakso", 
      NoResi: "#0003", 
      TotalPembayaran: "Total Pembayaran", 
      StatusPesanan: "Selesai", 
      Waktu: "10 - December - 2025"
    ),
    TransactionModel(
      Harga: "Rp 5000", 
      Menu: "Teh", 
      NoResi: "#0004", 
      TotalPembayaran: "Total Pembayaran", 
      StatusPesanan: "Selesai", 
      Waktu: "10 - December - 2025"
    ),
    TransactionModel(
      Harga: "Rp 80000", 
      Menu: "Mie Goreng, Teh,Jus,Bakso", 
      NoResi: "#0005", 
      TotalPembayaran: "Total Pembayaran", 
      StatusPesanan: "Selesai", 
      Waktu: "10 - December - 2025"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSectionTransaksi(
              QueryStatus: _QuerySelectedStatus,
              CategoryStatus: _CategoryStatus,
              onCategoryTap: (index){
                setState(() {
                  _QuerySelectedStatus = index;
                });
              },
            ),
            
            SizedBox(height: 20,),

            ..._TransactionList.map((TransactionItem){
              return CardTransaction(Transaction: TransactionItem);
            }),
            
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}



class HeaderSectionTransaksi extends StatelessWidget{
  
  final int QueryStatus;
  final List<String> CategoryStatus;
  final Function(int) onCategoryTap;

  const HeaderSectionTransaksi({
    super.key,
    required this.QueryStatus,
    required this.CategoryStatus,
    required this.onCategoryTap,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Riwayat Transaksi",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),

          
          SizedBox(height: 30,),
          //Kategori Riwawat Transaksi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(CategoryStatus.length, (index){
              bool isStatus = QueryStatus == index;
              return GestureDetector(
                onTap: () => onCategoryTap(index),
                child: AnimatedContainer(
                  
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isStatus ? Colors.white : Colors.grey[45],
                    borderRadius: BorderRadius.circular(15),
                    border: isStatus ? null : Border.all(color: Colors.white)
                  ),
                  child: Text(
                    CategoryStatus[index],
                    style: TextStyle(
                      color: isStatus ? Colors.deepOrangeAccent : Colors.white,
                      fontWeight: isStatus ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),

    );
  }
}

class TransactionModel{
  final String NoResi;
  final String StatusPesanan;
  final String Waktu;
  final String Menu;
  final String TotalPembayaran;
  final String Harga;

  TransactionModel({
    required this.Harga,
    required this.Menu,
    required this.NoResi,
    required this.TotalPembayaran,
    required this.StatusPesanan,
    required this.Waktu,
  });
}

class CardTransaction extends StatelessWidget{
  final TransactionModel Transaction;
  const CardTransaction ({super.key, required this.Transaction});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10 ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5),blurRadius: 8,offset: Offset(0, 5))
        ],
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Transaction.NoResi,
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  Transaction.StatusPesanan,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 13,),

          Row(
            children: [
              Icon(Icons.date_range,color: Colors.grey,size: 18,),
              SizedBox(width: 10,),
              Text(
                Transaction.Waktu,  
              ),
            ],
          ),
          
          SizedBox(height: 10,),

          Text(
            Transaction.Menu,
            style: TextStyle(
              color: Colors.grey,
              
            ),
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Transaction.TotalPembayaran,
              ),

              Text(
                Transaction.Harga,
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              Container(
                width: 200,
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
                  ),
                  child: Text( 
                    "Lihat Detail", 
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                  
                  },
                ),
              ),  
              
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.deepOrangeAccent[200]),
                  ),
                  child: Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    "Pesan Lagi",
                  ),
                  onPressed: () {
                  
                  },
                ),
              ),
              
            ],
          )
        
        ],
      ),
     
    );
  }
}