part of 'ordered.dart';

Ordered _$OrderedFromJson(Map<String, dynamic> json) {
  return Ordered(
      id: json['id'] as int?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      orderedTable: json['orderedTable'] == null
          ? null
          : my.Table.fromJson(json['orderedTable'] as Map<String, dynamic>),
      status: json['status'] as String?,
      description: json['description'] as String?);
}

Map<String, dynamic> _$OrderedToJson(Ordered instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.status,
      'description': instance.description,
      'image': instance.product,
      'orderedTable': instance.orderedTable
    };
