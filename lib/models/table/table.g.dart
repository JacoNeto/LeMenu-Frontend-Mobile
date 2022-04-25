part of 'table.dart';

Table _$TableFromJson(Map<String, dynamic> json) {
  return Table(
      id: json['id'] as int?,
      code: json['code'] as String?,
      isOpen: json['isOpen'] as bool?);
}

Map<String, dynamic> _$TableToJson(Table instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'isOpen': instance.isOpen
    };
