import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Garis-garis atas menggunakan image
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Image.asset(
                  'assets/icons/design-bg.png', // Gambar garis-garis di atas
                ),
              ),
              // Gambar logo tengah
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/icons/logo-screen.png', // Gambar logo Y-Mart
                ),
              ),
              const SizedBox(height: 20),
              // Ganti teks 'Y-MART' dengan gambar
              Image.asset(
                'assets/icons/logo-text.png', // Gambar teks Y-MART
                height: 40,
              ),
              const SizedBox(height: 10),
              // Deskripsi aplikasi
              const Text(
                'Nutritious and Delicious\nFood Delivered',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF474646),
                ),
              ),
              const SizedBox(height: 100),
              // Tombol 'Get Started'
              ElevatedButton(
                onPressed: () {
                  // Aksi yang akan dilakukan saat tombol 'Get Started' diklik
                  // Navigasi ke halaman Signup atau Home
                  Navigator.pushNamed(
                      context, '/signup'); // Routing ke halaman SignupPage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              // Teks untuk login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have already an account?',
                    style: TextStyle(color: Color(0xFF474646)),
                  ),
                  TextButton(
                    onPressed: () {
                      // Aksi untuk login
                      Navigator.pushNamed(
                          context, '/login'); // Routing ke halaman LoginPage
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
