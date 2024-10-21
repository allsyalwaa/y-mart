import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              // Judul Halaman
              const Text(
                'Forgot\npassword?',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF474646)),
              ),
              const SizedBox(height: 20),
              // TextField untuk input email
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none, // Hilangkan outline
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 10),
              // Deskripsi kecil di bawah email
              const Text(
                '* We will send you a message to set or reset your new password',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 40),
              // Tombol Submit
              SizedBox(
                width: double.infinity, // Lebar penuh
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi submit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
