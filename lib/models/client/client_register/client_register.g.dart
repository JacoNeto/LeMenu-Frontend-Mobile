part of 'client_register.dart';

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
      tableId: json['tableId'] as int?, name: json['name'] as String?);
}

Map<String, dynamic> _$ClientToJson(Client instance) =>
    <String, dynamic>{'tableId': instance.tableId, 'name': instance.name};
