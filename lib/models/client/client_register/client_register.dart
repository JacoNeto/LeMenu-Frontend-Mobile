part 'client_register.g.dart';

class Client {
  int? tableId;
  String? name;

  Client({this.tableId, this.name});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
