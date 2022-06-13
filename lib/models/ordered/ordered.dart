import '../product/product.dart';
import '../table/table.dart' as my;

part 'ordered.d.dart';

class Ordered {
  int? id;
  String? status;
  String? description;
  Product? product;
  my.Table? orderedTable;

  Ordered(
      {this.id,
      this.status,
      this.description,
      this.product,
      this.orderedTable});

  factory Ordered.fromJson(Map<String, dynamic> json) =>
      _$OrderedFromJson(json);
  Map<String, dynamic> toJson() => _$OrderedToJson(this);
}
