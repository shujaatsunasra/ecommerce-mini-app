import 'package:hive/hive.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_item.dart';
import '../../../product/domain/entities/product.dart';

class CartAdapter extends TypeAdapter<Cart> {
  @override
  final int typeId = 1;

  @override
  Cart read(BinaryReader reader) {
    final items = reader.readList().cast<CartItem>();
    return Cart(items: items);
  }

  @override
  void write(BinaryWriter writer, Cart obj) {
    writer.writeList(obj.items);
  }
}

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 2;

  @override
  CartItem read(BinaryReader reader) {
    final product = reader.read() as Product;
    final quantity = reader.readInt();
    return CartItem(product: product, quantity: quantity);
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    writer.write(obj.product);
    writer.writeInt(obj.quantity);
  }
}
