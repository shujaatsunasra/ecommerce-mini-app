import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    return Product(
      id: reader.readInt(),
      title: reader.readString(),
      description: reader.readString(),
      price: reader.readDouble(),
      discountPercentage: reader.readDouble(),
      rating: reader.readDouble(),
      stock: reader.readInt(),
      brand: reader.readString(),
      category: reader.readString(),
      thumbnail: reader.readString(),
      images: reader.readList().cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeDouble(obj.price);
    writer.writeDouble(obj.discountPercentage);
    writer.writeDouble(obj.rating);
    writer.writeInt(obj.stock);
    writer.writeString(obj.brand ?? '');
    writer.writeString(obj.category);
    writer.writeString(obj.thumbnail ?? '');
    writer.writeList(obj.images);
  }
}
