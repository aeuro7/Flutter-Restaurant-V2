import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.star,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final int star;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/viewMenu', arguments: {
          'name': name,
          'description': description,
          'price': price,
          'image': image,
          'star': star,
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 191, 191, 191),
              blurRadius: 8.0,
              spreadRadius: 0.2,
              offset: Offset(3.0, 3.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // ทำมุมโค้งมน
              child: Image.asset(
                "assets/images/$image",
                height: 130,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                '£$price',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 153, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(star, (index) {
                  return const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 243, 186, 0), // สีเหลืองของดาว
                    size: 15.0,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
