part of 'client.dart';

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(id: json['id'] as int?, name: json['name'] as String?);
}

Map<String, dynamic> _$ClientToJson(Client instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
