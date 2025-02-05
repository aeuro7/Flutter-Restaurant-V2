import 'package:bloc/bloc.dart';

class Product {
  final String name;
  final int price;
  final int quantity;
  final String image;

  Product({required this.name, required this.price, required this.quantity, required this.image});

  Product copyWith({String? name, int? price, int? quantity}) {
    return Product(
      image: image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

class OrderState {
  final List<Product> cartItems;

  OrderState({required this.cartItems});

  OrderState copyWith({List<Product>? cartItems}) {
    return OrderState(cartItems: cartItems ?? this.cartItems);
  }
}

abstract class OrderEvent {}

class AddProduct extends OrderEvent {
  final Product product;
  AddProduct(this.product);
}

class RemoveProduct extends OrderEvent {
  final String productName;
  RemoveProduct(this.productName);
}

class UpdateQuantity extends OrderEvent {
  final String productName;
  final int quantity;
  UpdateQuantity({required this.productName, required this.quantity});
}

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState(cartItems: [])) {
    on<AddProduct>((event, emit) {
      final index = state.cartItems.indexWhere((item) => item.name == event.product.name);
      List<Product> updatedCart = List.from(state.cartItems);

      if (index != -1) {
        updatedCart[index] = updatedCart[index].copyWith(quantity: updatedCart[index].quantity + 1);
      } else {
        updatedCart.add(event.product.copyWith(quantity: event.product.quantity)); // ใช้ค่าที่ส่งมา
      }
      
      emit(state.copyWith(cartItems: updatedCart));
    });

    on<RemoveProduct>((event, emit) {
      final updatedCart = state.cartItems.where((item) => item.name != event.productName).toList();
      emit(state.copyWith(cartItems: updatedCart));
    });

    on<UpdateQuantity>((event, emit) {
      final index = state.cartItems.indexWhere((item) => item.name == event.productName);
      if (index != -1) {
        List<Product> updatedCart = List.from(state.cartItems);
        if (event.quantity > 0) {
          updatedCart[index] = updatedCart[index].copyWith(quantity: event.quantity);
        } else {
          updatedCart.removeAt(index);
        }
        emit(state.copyWith(cartItems: updatedCart));
      }
    });
  }

  List<Product> getCartItems() {
    return state.cartItems;
  }
}
