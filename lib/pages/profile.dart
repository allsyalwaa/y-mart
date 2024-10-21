import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/icons/logo.png', // Menggunakan logo seperti di HomePage
          height: 35,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
          ),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali ke halaman sebelumnya
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/profile.png'),
              radius: 20,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/icons/profile.png'),
                radius: 50,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 20),
              _buildCustomTextField("Username"),
              const SizedBox(height: 15),
              _buildCustomTextField("Email"),
              const SizedBox(height: 15),
              _buildCustomTextField("Password"),
              const SizedBox(height: 15),
              _buildCustomTextField("Phone"),
              const SizedBox(height: 15),
              _buildCustomTextField("Address", maxLines: 3),
              const SizedBox(height: 30),
              SizedBox(
                width: double
                    .infinity, // Mengatur lebar tombol sesuai dengan layar
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildNavBarItem(
              'assets/icons/home.svg',
              'Home',
              0,
              2, // Set Profile sebagai tab aktif
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarItem(
              'assets/icons/cart.svg',
              'Cart',
              1,
              2,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarItem(
              'assets/icons/account.svg',
              'Profile',
              2,
              2,
            ),
            label: '',
          ),
        ],
        currentIndex: 2, // Set 'Profile' sebagai tab aktif
        selectedItemColor: Colors.redAccent,
        onTap: (index) {
          // Handle bottom navigation tab switch
        },
      ),
    );
  }

  Widget _buildCustomTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }

  Widget _buildNavBarItem(
      String iconPath, String label, int index, int selectedIndex) {
    bool isSelected = selectedIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isSelected)
          Container(
            width: 40,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        const SizedBox(height: 5),
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            iconPath,
            color: isSelected ? Colors.redAccent : Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.redAccent : Colors.grey,
          ),
        ),
      ],
    );
  }
}
