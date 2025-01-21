import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:my_project/main.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 10000.0, sigmaY: 10000.0), // เพิ่มเบลอ
                    child: AppBar(
                      elevation: 0, // ลบเงา
                      backgroundColor: Colors.white.withOpacity(0.3), // โปร่งใส
                      surfaceTintColor: Colors.transparent, // ลบสีเงา
                      centerTitle: true,
                    )))),
        body: ListView(children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/8.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: 200,
            height: 500,
          ),
          Container(
            height: 50,
            child: const Center(child: Text('Mürren Restaurant™',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          ),
          InkWell(
            onTap: () {
              // ใช้ Navigator.push เพื่อนำทางไปยังหน้าใหม่โดยไม่ลบ BottomNavigationBar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Mürren Restaurant')),
              );
            },
            child: Container(
            height: 50,
            width: 100,
            margin: const EdgeInsets.fromLTRB(80, 10, 80, 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 38, 38, 38),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Center(child: Text('Order Now',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),))
            
          ),
          )

        ]));
  }
}
