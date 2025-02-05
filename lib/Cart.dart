import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order.dart'; // Import Bloc

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.3),
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: const Text("My Cart"),
            ),
          ),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          double totalPrice = state.cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

          return SizedBox(
            height: 800,
            
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = state.cartItems[index];
                      return CartItem(product: product);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(147, 185, 185, 185),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.red,
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total:",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\£${totalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.green,
                          boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(148, 119, 119, 119),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                        ),
                        child: const Center(
                          child: Text(
                            "Checkout",
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        ),
                        
                        ),
                        const SizedBox(height: 15,),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {

  final Product product;
  const CartItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/${product.image}'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(148, 119, 119, 119),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Price: \£${product.price}"),
                  Text("Quantity: ${product.quantity}"),
                  Text("Total: \£${(product.price * product.quantity).toStringAsFixed(2)}"),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                context.read<OrderBloc>().add(RemoveProduct(product.name));
              },
            ),
          ],
        ),
      ),
    );
  }
}
