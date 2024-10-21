import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/icons/logo.png',
          height: 35,
        ),
        backgroundColor: Colors.white,
        elevation: 0,

        // Menambahkan ikon di kiri menggunakan SvgPicture
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
          ),
          onPressed: () {},
        ),
        // Menambahkan ikon profil di kanan menggunakan CircleAvatar
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/icons/profile.png'), // Ganti dengan path file ikon profil Anda
              radius: 20, // Sesuaikan ukuran ikon profil
              backgroundColor:
                  Colors.transparent, // Agar tidak ada latar belakang
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Konten lainnya yang bisa di-scroll
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100.0), // Menghindari tumpang tindih dengan search bar
              child: Column(
                children: [
                  // Menambahkan banner SVG di bawah search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      child: Image.asset(
                        'assets/icons/banner.png', // Ganti dengan path file banner SVG Anda
                        height: 150, // Tinggi banner
                      ),
                    ),
                  ),

                  // Menambahkan kategori yang bisa di-scroll ke samping
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft, // Mengatur teks ke kiri
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120, // Tinggi untuk item kategori
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryItem(
                            context,
                            'assets/icons/fruits.png', // Path ke ikon SVG kategori
                            'Fruits',
                          ),
                          _buildCategoryItem(
                            context,
                            'assets/icons/vegetables.png', // Path ke ikon SVG kategori
                            'Vegetables',
                          ),
                          _buildCategoryItem(
                            context,
                            'assets/icons/smoothies.png', // Path ke ikon SVG kategori
                            'Smoothies',
                          ),
                          _buildCategoryItem(
                            context,
                            'assets/icons/juice.png', // Path ke ikon SVG kategori
                            'Juices',
                          ),
                          _buildCategoryItem(
                            context,
                            'assets/icons/salad.png', // Path ke ikon SVG kategori
                            'Salad',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Di dalam widget HomePage (di bawah bagian Categories):
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Popular Products",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true, // Agar grid bisa di-scroll
                    physics:
                        NeverScrollableScrollPhysics(), // Grid tidak bisa di-scroll terpisah
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Jumlah kolom per baris
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio:
                          0.6, // Perbandingan lebar dan tinggi grid
                    ),
                    itemCount:
                        products.length, // Jumlah produk yang ingin ditampilkan
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPopularProductItem(
                        context,
                        products[index].imagePath, // Gambar produk
                        products[index].name, // Nama produk
                        products[index].price, // Harga produk
                        products[index].rating, // Rating produk
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Search bar tetap berada di atas dengan background putih
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Menambahkan background putih
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 5), // Mengatur bayangan di bawah
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(
                          12.0), // Menambahkan padding untuk ikon SVG
                      child: SvgPicture.asset(
                        'assets/icons/search.svg', // Path ke ikon pencarian SVG
                        height: 20, // Sesuaikan ukuran ikon pencarian
                        width: 20,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk membuat item kategori
Widget _buildCategoryItem(BuildContext context, String iconPath, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.redAccent,
                width: 2), // Warna dan ketebalan border
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              iconPath, // Path ke ikon SVG
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent, // Warna teks
          ),
        ),
      ],
    ),
  );
}

Widget _buildPopularProductItem(BuildContext context, String imagePath,
    String name, double price, double rating) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bagian gambar
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Menyebarkan harga, rating, dan tombol plus
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$$price",
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.add_circle, color: Colors.redAccent),
                onPressed: () {
                  // Aksi ketika tombol tambah ditekan
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class Product {
  final String imagePath;
  final String name;
  final double price;
  final double rating;

  Product(this.imagePath, this.name, this.price, this.rating);
}

List<Product> products = [
  Product('assets/icons/apple.png', 'Green Apple', 9.55, 4.5),
  Product('assets/icons/orange-juice.png', 'Orange Juice', 5.62, 4.0),
  Product('assets/icons/grape-smoothie.png', 'Grape Smoothie', 8.54, 4.2),
  Product('assets/icons/lettuce.png', 'Lettuce', 3.55, 4.1),
  Product('assets/icons/salad-tonno.png', 'Salad Tonno', 29.65, 4.6),
  Product('assets/icons/strawberry-smoothie.png', 'Strawberry Smoothie', 13.62,
      4.7),
];
