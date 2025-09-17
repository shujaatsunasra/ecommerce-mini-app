import 'package:hive/hive.dart';
import '../../domain/entities/wishlist.dart';
import '../../../product/domain/entities/product.dart';

class WishlistAdapter extends TypeAdapter<Wishlist> {
  @override
  final int typeId = 3;

  @override
  Wishlist read(BinaryReader reader) {
    final products = reader.readList().cast<Product>();
    return Wishlist(products: products);
  }

  @override
  void write(BinaryWriter writer, Wishlist obj) {
    writer.writeList(obj.products);
  }
}
