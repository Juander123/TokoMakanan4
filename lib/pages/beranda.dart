import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BerandaPage extends StatefulWidget{
  const BerandaPage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BerandaPage();
  } 
}


class _BerandaPage extends State<BerandaPage>{
  
  //Query Selector dari kategori 
  int _querySelectorIndex = 0;

  //Nama/List dari Kategori
  final List<String> _Categories = ["Semua", "Makanan", "Minuman","Jus","Sayur",];

  //Variabel Angka Pembelian
  
  //Nama/List dari FoodModel
  final List<FoodModel> _foodList = [
    FoodModel(
      title: "Nasi Goreng", 
      ImageURl: "../../assets/images/nasigoreng.jpg", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.8", 
      sold: "100 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Mie Goreng", 
      ImageURl: "../../assets/images/miegoreng.jpg", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.7", 
      sold: "54 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Kwetiau", 
      ImageURl: "../../assets/images/kwetiau.jpg", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.8", 
      sold: "23 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Bakso", 
      ImageURl: "../../assets/images/bakso.jpg", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.8", 
      sold: "74 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Es Jeruk", 
      ImageURl: "../../assets/images/es-jeruk.jpg", 
      harga: "Rp5.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "100 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Es Kopi Susu", 
      ImageURl: "../../assets/images/es-kopi-susu.jpg", 
      harga: "Rp8.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "79 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Teh", 
      ImageURl: "../../assets/images/teh.jpg", 
      harga: "Rp5.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "71 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Jus", 
      ImageURl: "../../assets/images/jus.jpg", 
      harga: "Rp10.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "74 Terjual",
      jumlah: 0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HeaderSection
            HeaderSection(),

            const SizedBox(height: 10,),


            //Kategori Menu
            CategorySelector(
              categories: _Categories, 
              selectedIndex: _querySelectorIndex, 
              onCategoryTap: (index){
                setState(() {
                  _querySelectorIndex = index;
                });
              }
            ),


            SizedBox(height: 20,),


            //Konten Utama / FoodCard
            ..._foodList.map((foodItemm){

              return FoodCard(food: foodItemm);
            })
          ],
        ),
      ),
    );
  }
}

//Header Section
class HeaderSection extends StatelessWidget{
  const HeaderSection({super.key});

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      //Kotak Orange
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )
      ),

      //Isi konten dari kotak orange
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Text Selamat datang, nama dan Icon profile
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text Selamat Datang dan nama
                  Text("Selamat Datang di,", style: TextStyle(color: Colors.white, fontSize: 20 ,),),  
                  Text("Cafe & Resto Bintara",style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
                ],
              ),
              //Icon Profile
              CircleAvatar(
                
                backgroundColor: Colors.white,  
                radius: 30,
                child: const Icon(Icons.person, size: 40,color: Colors.grey,),
              ),
            ],
          ),

          const SizedBox(height: 20,),

          //Search Box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            child: const TextField(
                decoration: InputDecoration(
                  hintText: "Cari Makanan & Minuman",
                  border:  InputBorder.none,
                  icon: const Icon(Icons.search),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

//Kategori Menu
class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategoryTap; //  function callback

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(categories.length, (index) {
          bool isActive = selectedIndex == index;
          return GestureDetector( // GestureDetector membuat container bisa diklik
            onTap: () => onCategoryTap(index), // Memanggil fungsi di parent
            child: AnimatedContainer( // AnimatedContainer membuat transisi warna halus
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? Colors.deepOrange : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: isActive ? null : Border.all(color: Colors.grey.shade300),
                boxShadow: isActive ? [
                  BoxShadow(color: Colors.deepOrange.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))
                ] : [],
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

//Class Data dari Foodmodel untuk FoodCard
class FoodModel{
  final String title;
  final String kategri;
  final String sold;
  final String harga;
  final String rating;
  final String ImageURl;
  final int jumlah;

  FoodModel({
    required  this.title,
    required this.ImageURl,
    required this.harga,
    required this.kategri,
    required this.rating,
    required this.sold,
    required this.jumlah,
    
  });
}

class FoodCard extends StatefulWidget{

  final FoodModel food;

  const FoodCard({super.key, required this.food});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  //Variabel untuk mengubah iconFavorite
  bool isFavorite = false;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
    //Backroun putihnya
    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          offset: Offset(0, 5),
          blurRadius: 8
        ),
      ]
    ),
    child: Row(
     children: [
      //Gambar Konten
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          widget.food.ImageURl,
          width: 100,
          height: 110,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey,width: 100,height: 100,child: Icon(Icons.broken_image),),
        ),
      ),

      SizedBox(width: 15,),

      //Penjelasan konten
      Expanded(
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text Title & Icon Favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text Title
                Text(
                  widget.food.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Icon Favorite
                IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outlined,color: isFavorite ? Colors.red : Colors.grey,),
                  
                  onPressed: () { 
                    setState(() {
                      isFavorite  = !isFavorite;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 8,),
            
            //Nama Kategori
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
              //Background Kategori
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              //Text kategori
              child: Text(
                widget.food.kategri,
                style: TextStyle(color: Colors.deepOrange[300],fontWeight: FontWeight.bold,fontSize: 13 ),
              ),
            ),

            SizedBox(height: 8,),

            //Rating & Penjualan
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Icon Star dan Rating
                Icon(Icons.star,color: Colors.yellow,),
                Text(
                  widget.food.rating,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                SizedBox(width: 35),
                
                //Text penjualan
                Text(
                  widget.food.sold,
                  style: TextStyle(
                    fontSize: 12
                  ),
                )
              ],
            ),

            SizedBox(height: 8,),

            //harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text Harga
                Text(
                  widget.food.harga,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    
                  },
                ),
                Text(
                  widget.food.jumlah.toString(),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                   
                  },
                ),

                ElevatedButton(
                  child: Text(
                    "Pesan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.deepOrangeAccent.shade200),
                  ),
                  onPressed: () {
                    
                  },
                )
                
              ],
            ),  
          ],
        ),
      ),
      
     ],
    ),
   );
  }
}