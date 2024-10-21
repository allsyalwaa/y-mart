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
      // Menambahkan search bar di bawah AppBar dengan ikon pencarian SVG
      body: Column(
        children: [
          Padding(
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
                textAlign: TextAlign
                    .left, // Menambah textAlign untuk memastikan teks rata kiri
              ),
            ),
          ),
          SizedBox(
            height: 160, // Tinggi untuk item kategori
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Kategori 1
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

                  // Tambahkan lebih banyak kategori jika diperlukan
                ],
              ),
            ),
          ),

          // Di dalam class HomePage, tambahkan widget berikut setelah kategori
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft, // Mengatur teks ke kiri
              child: Text(
                "Popular Products",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left, // Untuk memastikan teks rata kiri
              ),
            ),
          ),
          SizedBox(
            height: 200, // Tinggi untuk produk populer
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildPopularProduct(
                    'assets/icons/apple.png', // Path ke gambar produk Green Apple
                    'Green Apple',
                    9.55,
                    4.5, // Rating untuk produk
                  ),
                  _buildPopularProduct(
                    'assets/icons/orange-juice.png', // Path ke gambar produk Orange Juice
                    'Orange Juice',
                    5.62,
                    4.0, // Rating untuk produk
                  ),
                  // Tambahkan lebih banyak produk populer jika diperlukan
                ],
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

// Widget untuk membuat item popular products
Widget _buildPopularProduct(
    String imagePath, String productName, double price, double rating) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5), // Bayangan untuk produk
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 150, // Sesuaikan ukuran gambar produk
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$$price',
              style: TextStyle(
                fontSize: 16,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 16,
                );
              }),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
