import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../pagesProfile/InformasiAkun/editProfile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    
    
    // TODO: implement createState
    return _HomePage();
  } 
}


class _HomePage extends State<HomePage>{
  
  //Query Selector dari kategori 
  int _querySelectorIndex = 0;

  //Nama/List dari Kategori
  final List<String> _Categories = ["Semua", "Makanan", "Minuman","Jus","Sayur",];

  //Variabel Angka Pembelian
  
  //Nama/List dari FoodModel
  final List<FoodModel> _foodList = [
    FoodModel(
      title: "Nasi Goreng", 
      ImageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRKnuYfGJkzDkDiFLkVgNgQb-EVzserHgLoQ&s", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.8", 
      sold: "100 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Mie Goreng", 
      ImageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCFQUrE5kEgi8DJnQu5li_8T1CjmACPJNrg&s", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.7", 
      sold: "54 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Kwetiau",   
      ImageURl: "https://assets.unileversolutions.com/recipes-v2/257879.jpg", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.8", 
      sold: "23 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Bakso", 
      ImageURl: "https://assets.unileversolutions.com/recipes-v2/245281.jpg", 
      harga: "Rp15.000", 
      kategri: "Makanan", 
      rating: "4.8",  
      sold: "74 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Es Jeruk", 
      ImageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgi6-SFK7EB-_ApAHdDXqkJoFf-LN6ms8MUg&s", 
      harga: "Rp5.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "100 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Es Kopi Susu", 
      ImageURl: "https://i0.wp.com/www.gabag-indonesia.com/wp-content/uploads/2024/11/Kreasi-Resep-Es-Kopi-Susu-Gula-Aren-Kekinian-yang-Lezat-3.png?resize=853%2C545&ssl=1", 
      harga: "Rp8.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "79 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Teh", 
      ImageURl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtZJf5Ext31aKykYwMkEpJEHv2Y76imiEVPA&s", 
      harga: "Rp5.000", 
      kategri: "Minuman", 
      rating: "4.8", 
      sold: "71 Terjual",
      jumlah: 0,
    ),
    FoodModel(
      title: "Jus", 
      ImageURl: "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/3a6c8584-4fca-45ee-a68e-e33fa8d8f0d4_Go-Biz_20210916_212919.jpeg", 
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
                child: IconButton(
            
                  icon: Icon(Icons.person, size: 40,color: Colors.grey,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) {
                      return EditProfile();
                    }));
                  },
                )
                
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
    int jumlah;

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
  int isTambah = 0;

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
        child: Image.network(
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

            //Harga
            Text(
                  widget.food.harga,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
            
            SizedBox(height: 5,),


            //Jumlah Kuantitas dan Harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    //Button Minus
                    InkWell(
                      child: Icon(Icons.remove),
                      onTap: () {
                        setState(() {
                          if(isTambah > 0){
                            isTambah--; 
                          }
                        });
                      },
                    ),

                    SizedBox(width: 15,),

                    //Text Kuantitas
                    Text(
                      "$isTambah"
                    ),

                    SizedBox(width: 15,),

                    //Button Plus
                    InkWell(
                      child:  Icon(Icons.add),
                      onTap: () {
                       setState(() {
                         isTambah ++;
                       });
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      if (isTambah > 0){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Berhasil Menambahkan $isTambah ${widget.food.title} ke Keranjang",
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(20),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:Text(
                              "Silahkan Tentukan Jumlah  Dulu",
                            ),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      };
                    }
                  ),
                ),
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