part 'product.g.dart';

class Product {
  int? id;
  String? name;
  double? price;
  double? sale;
  String? description;
  String? image;
  bool? isOnMenu;

  Product(
      {this.id,
      this.name,
      this.price,
      this.sale,
      this.description,
      this.image,
      this.isOnMenu});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
