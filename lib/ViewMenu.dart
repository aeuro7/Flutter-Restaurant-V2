import 'package:flutter/material.dart';
import 'dart:ui';

class ViewMenu extends StatelessWidget {
  const ViewMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final String name = args['name'];
    final String description = args['description'];
    final int price = args['price'];
    final String image = args['image'];
    final int star = args['star'];
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 10000.0, sigmaY: 10000.0), // เพิ่มเบลอ
                    child: AppBar(
                      elevation: 0, // ลบเงา
                      title: Text(name),
                      backgroundColor: Colors.white.withOpacity(0.3), // โปร่งใส
                      surfaceTintColor: Colors.transparent, // ลบสีเงา
                      centerTitle: true,
                    )))),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  alignment: Alignment.center,
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${image}'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(150, 0, 0, 0), // สีของเงา
                        offset: Offset(0.0, 0.0), // การเลื่อนเงา (X, Y)
                        blurRadius: 20.0, // ความเบลอของเงา
                        spreadRadius: 5.0, // ขนาดการกระจายของเงา
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(star, (index) {
                      return const Icon(
                        Icons.star,
                        color: Color.fromARGB(
                            255, 243, 186, 0), // ตั้งค่าเป็นสีเหลือง
                        size: 30.0,
                      );
                    }),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      '£$price',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Lora',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 153, 0),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
