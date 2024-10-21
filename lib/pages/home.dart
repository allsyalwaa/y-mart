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
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 100, // Tinggi untuk item kategori
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
        ],
      ),
    );
  }
}

// Widget untuk membuat item kategori
Widget _buildCategoryItem(BuildContext context, String iconPath, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.redAccent,
                width: 2), // Warna dan ketebalan border
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              iconPath, // Path ke ikon SVG
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent, // Warna teks
          ),
        ),
      ],
    ),
  );
}
