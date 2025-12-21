import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toko_makanan4/chekout/chekout.dart';
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

  int totalItemInCart = 0;
  int totalPriceInCart = 0;
  bool isCartVisible = false;
  
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
  
  void updateCart(int qty,int price){
    setState(() {
      totalItemInCart += qty;
      totalPriceInCart += price;
      isCartVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 10),
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
                LayoutBuilder(
                  builder: (BuildContext context,BoxConstraints constraints){
                    if(constraints.maxWidth < 600) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                           ..._foodList.map((foodItemm){      
                          return FoodCard(
                            food: foodItemm,
                            onAddToCart: (qty, price) {
                               updateCart(qty, price);
                            }
                          );
                          })
                        ]
                      );
                } return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 450,
                    mainAxisExtent: 220,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                  ), 
                  itemCount: _foodList.length,

                  itemBuilder: (context,index){
                    return Center(
                      child: FoodCard(
                        food: _foodList[index],
                        onAddToCart: (qty, price) {
                           updateCart(qty, price);
                        }
                      ),
                    );
                  }
                );
              },
            ),
              ],
            ),
          ), 
                        

          if(isCartVisible)
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              
              child: Container(
                height: 75,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                      BoxShadow(color: Colors.black, blurRadius: 5,offset: Offset(0, 2)),
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    IconButton(

                      icon: Icon(Icons.close,color: Colors.white,),
                      onPressed: () {
                        setState(() {
                          totalItemInCart = 0;
                          totalPriceInCart = 0;
                          isCartVisible = false;
                        });
                      },
                    ),
                    
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white,
                    ),
                    
                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$totalItemInCart di keranjang",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "$totalPriceInCart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Chekout();
                        }));
                      },
                      child: Text(
                        "Chekout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ],
                ),
              )
            )
        ],
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

  final Function(int quantity, int totalPrice) onAddToCart;

  const FoodCard({super.key, required this.food,required this.onAddToCart});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  //Variabel untuk mengubah iconFavorite
  bool isFavorite = false;
  int isTambah = 0;

  int getHargaInt(String hargaStr){
    String cleanString = hargaStr.replaceAll(RegExp(r'[^0-9]'), '');
    return int.parse(cleanString);
  }

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
          mainAxisSize: MainAxisSize.min,
          children: [
            //Text Title & Icon Favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text Title
                Flexible(
                  child: Text(
                    widget.food.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                //Icon Favorite
                IconButton(
                  constraints: BoxConstraints(),
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outlined,color: isFavorite ? Colors.red : Colors.grey,),
                  
                  onPressed: () { 
                    setState(() {
                      isFavorite  = !isFavorite;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 4,),
            
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

            SizedBox(height: 4,),

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

                SizedBox(width: 10),  
                
                //Text penjualan
                Text(
                  widget.food.sold,
                  style: TextStyle(
                    fontSize: 12
                  ),
                )
              ],
            ),

            SizedBox(height: 4,),

            //Harga
            Text(
                  widget.food.harga,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
            
            SizedBox(height: 4,),


            //Button Kuantitas dan Harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Button Minus
                    InkWell(  
                      child: Icon(Icons.remove,size: 18,),
                      onTap: () {
                        setState(() {
                          if(isTambah > 0){
                            isTambah--; 
                          }
                        });
                      },
                    ),

                    SizedBox(width: 4,),

                    //Text Kuantitas
                    Text(
                      "$isTambah",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    SizedBox(width: 4,),

                    //Button Plus
                    InkWell(
                      child:  Icon(Icons.add,size: 18,),
                      onTap: () {
                       setState(() {
                         isTambah ++;
                       });
                      },
                    ),
                  ],
                ),

                //Button Pesan
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {
                      if (isTambah > 0){
                        int hargaSatuan = getHargaInt(widget.food.harga);
                        int totalHargaItem = hargaSatuan *isTambah;

                        widget.onAddToCart(isTambah,totalHargaItem);

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
