import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 1; // Set 'Cart' sebagai tab aktif

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Tambahkan navigasi berdasarkan index
      if (index == 0) {
        Navigator.pushNamed(context, '/home'); // Navigasi ke Home
      } else if (index == 1) {
        // Sudah di halaman Cart
      } else if (index == 2) {
        Navigator.pushNamed(context, '/profile'); // Navigasi ke Profile
      }
    });
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'My Cart',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildCartItem(
                    context, 'Green Apple', 9.55, 2, 'assets/icons/apple.png'),
                _buildCartItem(
                    context, 'Lettuce', 3.55, 1, 'assets/icons/lettuce.png'),
                _buildCartItem(context, 'Chinese Cabbage', 5.35, 1,
                    'assets/icons/cabbage.png'),
                _buildCartItem(
                    context, 'Mango', 5.43, 1, 'assets/icons/mango.png'),
                _buildCartItem(
                    context, 'Orange', 4.53, 1, 'assets/icons/orange.png'),
                _buildCartItem(
                    context, 'Melon', 7.55, 1, 'assets/icons/melon.png'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildNavBarItem(
              'assets/icons/home.svg',
              'Home',
              0,
              _selectedIndex,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarItem(
              'assets/icons/cart.svg',
              'Cart',
              1,
              _selectedIndex,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavBarItem(
              'assets/icons/account.svg',
              'Profile',
              2,
              _selectedIndex,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
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
                  offset: Offset(0, 3),
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

  Widget _buildCartItem(BuildContext context, String productName, double price,
      int quantity, String imagePath) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle,
                                color: Colors.redAccent),
                            onPressed: () {
                              // Handle decrease quantity
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: Colors.redAccent),
                            onPressed: () {
                              // Handle increase quantity
                            },
                          ),
                        ],
                      ),
                      Text(
                        '\$${(price * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    color: const Color(0xFF474646),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Handle remove item
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
