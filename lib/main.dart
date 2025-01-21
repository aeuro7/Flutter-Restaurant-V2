import 'package:flutter/material.dart';
import 'dart:ui';
import 'product.dart';
import 'ViewMenu.dart';
import 'BottonNav.dart';

void main() {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Restaurant App',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Bottonnav(),
            '/viewMenu': (context) => const ViewMenu(),
            '/BottonNav': (context) => const Bottonnav(),
            '/MyHomePage': (context) => const MyHomePage(title: 'Mürren Restaurant'),
          },
        );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> productData = [
      {
        'name': "Sushi OTORO",
        'description': "Freshly prepared sushi rolls with a variety of seafood and vegetables.",
        'price': 59,
        'image': "6.jpg",
        'star': 6,
      },
      {
        'name': "Sushi Shutoro",
        'description': "Freshly prepared sushi rolls with a variety of seafood and vegetables.",
        'price': 59,
        'image': "5.jpg",
        'star': 6,
      },
      {
        'name': "Prime Rib Steak",
        'description': "Succulent prime rib steak served with a gourmet sauce and seasonal vegetables.",
        'price': 399,
        'image': "1.jpg",
        'star': 5,
      },
      {
        'name': "Truffle Mashed Potatoes",
        'description': "Velvety mashed potatoes infused with premium truffle oil and fresh chives.",
        'price': 349,
        'image': "2.jpg",
        'star': 4,
      },
      {
        'name': "Signature Lobster Bisque",
        'description': "Rich and creamy lobster bisque garnished with fresh herbs and a hint of sherry.",
        'price': 429,
        'image': "3.jpg",
        'star': 3,
      },
      {
        'name': "Herb-Crusted Sea Bass",
        'description': "Delicately grilled sea bass with a fragrant herb crust and a citrus beurre blanc.",
        'price': 1099,
        'image': "4.jpg",
        'star': 5,
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10000.0, sigmaY: 10000.0), // เพิ่มเบลอ
            child: AppBar(
              elevation: 0, // ลบเงา
              backgroundColor: Colors.white.withOpacity(0.3), // โปร่งใส
              surfaceTintColor: Colors.transparent, // ลบสีเงา
              title: Text(title),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/BottonNav');
                },
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  onPressed: () => print("cart button clicked"),
                  icon: const Icon(Icons.shopping_bag_outlined),
                  color: const Color.fromARGB(255, 39, 39, 39),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // กำหนดจำนวนคอลัมน์
            crossAxisSpacing: 10, // ช่องว่างระหว่างคอลัมน์
            mainAxisSpacing: 10, // ช่องว่างระหว่างแถว
            childAspectRatio: 0.8, // กำหนดความสูงแต่ละคอลัมน์
          ),
          itemCount: productData.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductBox(
              name: productData[index]['name'],
              description: productData[index]['description'],
              price: productData[index]['price'],
              image: productData[index]['image'],
              star: productData[index]['star'],
            );
          },
        ),
      ),
    );
  }
}
