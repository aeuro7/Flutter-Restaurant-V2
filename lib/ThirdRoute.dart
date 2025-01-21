import 'package:flutter/material.dart';
import 'dart:ui';

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});
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
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              child: ListView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true, // ทำให้ลิสอยู่ตรงกลาง+++
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const Center(child: Text('Mürren Restaurant™')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('This App is developed by Mürren Group ©®')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Contact : 02-1234567')),
                  ),
                  Container(
                    height: 30,
                    child: const Center(child: Text('Version 2.1.0')),
                  ),
                ],
              )),
        ));
  }
}
