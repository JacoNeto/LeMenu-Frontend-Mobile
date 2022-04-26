part of 'product.dart';

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      sale: (json['sale'] as num?)?.toDouble(),
      description: json['description'] as String?,
      image: json['image'] as String?,
      isOnMenu: json['isOnMenu'] as bool);
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'sale': instance.sale,
      'description': instance.description,
      'image': instance.image,
      'isOnMenu': instance.isOnMenu
    };
