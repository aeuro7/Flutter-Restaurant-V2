import 'package:flutter/material.dart';
import 'package:my_project/SecondRoute.dart';
import 'package:my_project/ThirdRoute.dart';
import 'package:my_project/main.dart';

class Bottonnav extends StatefulWidget {
  const Bottonnav({super.key});

  @override
  State<Bottonnav> createState() => _BottonnavState();
}

class _BottonnavState extends State<Bottonnav> {
  List<dynamic> option = const [
    SecondRoute(),
    MyHomePage(title: 'Mürren Restaurant'),
    ThirdRoute(),
  ];
  int index = 0; // ตัวเลือกเริ่มต้นที่ 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: option[index], // ใช้ค่าจาก _pages มาแสดงใน body
      bottomNavigationBar: Container(
        // margin: EdgeInsets.all(20),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(300),
        //   color: Colors.transparent
        // ),
        // clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black, // สีของ item ที่ถูกเลือก
          unselectedItemColor: Colors.grey, // สีของ item ที่ไม่ได้เลือก
          elevation: 0, // ลบเงาออก
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank_rounded), label: "Menu"),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "About"),
          ],
          currentIndex: index, // ใช้ตัวแปร index ในการกำหนดสถานะที่เลือก
          onTap: (value) {
            setState(() {
              index = value; // เปลี่ยนค่า index เมื่อมีการเลือก
            });
          },
        ),
      ),
    );
  }
}
