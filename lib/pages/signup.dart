import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Gambar bagian atas
            Image.asset(
              'assets/icons/signup-image.png', // Ganti dengan gambar yang sesuai
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Konten halaman signup di bawah gambar
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 170.0), // Mengatur jarak dari atas gambar
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Teks untuk judul halaman
                        const Text(
                          'Create an',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF474646),
                          ),
                        ),
                        const Text(
                          'account',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF474646),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // TextField untuk email
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // Hilangkan outline
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // TextField untuk password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // Hilangkan outline
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // TextField untuk konfirmasi password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // Hilangkan outline
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Checkbox untuk syarat dan ketentuan
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: true, // Nilai checkbox, ubah sesuai logika
                              onChanged: (bool? newValue) {
                                // Aksi ketika checkbox berubah
                              },
                            ),
                            const Expanded(
                              child: Text(
                                'By checking this, I agree to the Terms and Conditions and Privacy Policy.',
                                style: TextStyle(color: Color(0xFF474646)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Tombol 'Sign Up'
                        SizedBox(
                          width: double.infinity, // Lebar penuh sesuai layar
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigasi ke halaman Home setelah sign up berhasil
                              Navigator.pushNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Pembatas 'or'
                        Row(
                          children: const [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'or',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Tombol 'Continue with Google'
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Aksi untuk sign up dengan Google
                            },
                            icon: Image.asset(
                              'assets/icons/google.png', // Gambar logo Google
                              height: 24,
                            ),
                            label: const Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              side: const BorderSide(color: Colors.redAccent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),

                        // Link untuk login jika sudah punya akun
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Have already an account?',
                                style: TextStyle(color: Color(0xFF474646)),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigasi ke halaman Login
                                  Navigator.pushNamed(context, '/login');
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
