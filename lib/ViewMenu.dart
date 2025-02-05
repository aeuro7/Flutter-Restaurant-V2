import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'order.dart';

class ViewMenu extends StatefulWidget {
  const ViewMenu({super.key});

  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  int quantity = 1; 

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
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: AppBar(
                      elevation: 0,
                      title: Text(name),
                      backgroundColor: Colors.white.withOpacity(0.3),
                      surfaceTintColor: Colors.transparent,
                      centerTitle: true,
                    )))),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/$image'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(150, 0, 0, 0),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(name, style: const TextStyle(fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(star, (index) {
                    return const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 243, 186, 0),
                      size: 30.0,
                    );
                  }),
                ),
                const SizedBox(height:20),
                Text(
                  '£$price',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 153, 0),
                  ),
                ),
                const SizedBox(height: 20),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 30),
                      onPressed: quantity > 1
                          ? () {
                              setState(() {
                                quantity--;
                              });
                            }
                          : null,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 30),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () {
                    context.read<OrderBloc>().add(AddProduct(Product(
                          image: image,
                          name: name,
                          price: price,
                          quantity: quantity, 
                        )));
                    Navigator.pop(context);
                  },
                  child: const Text("Add to Cart",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ));
  }
}
