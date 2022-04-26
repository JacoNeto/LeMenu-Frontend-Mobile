part of 'client_register.dart';

ClientRegister _$ClientRegisterFromJson(Map<String, dynamic> json) {
  return ClientRegister(
      tableId: json['tableId'] as int?, name: json['name'] as String?);
}

Map<String, dynamic> _$ClientRegisterToJson(ClientRegister instance) =>
    <String, dynamic>{'tableId': instance.tableId, 'name': instance.name};
