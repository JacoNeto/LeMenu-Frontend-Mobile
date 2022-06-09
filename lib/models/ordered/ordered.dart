import '../product/product.dart';

part 'ordered.d.dart';

class Ordered {
  int? id;
  String? status;
  String? description;
  Product? product;

  Ordered({this.id, this.status, this.description, this.product});

  factory Ordered.fromJson(Map<String, dynamic> json) =>
      _$OrderedFromJson(json);
  Map<String, dynamic> toJson() => _$OrderedToJson(this);
}
