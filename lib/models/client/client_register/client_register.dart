part 'client_register.g.dart';

class ClientRegister {
  int? tableId;
  String? name;

  ClientRegister({this.tableId, this.name});

  factory ClientRegister.fromJson(Map<String, dynamic> json) =>
      _$ClientRegisterFromJson(json);
  Map<String, dynamic> toJson() => _$ClientRegisterToJson(this);
}
