part 'client.g.dart';

class Client {
  int? id;
  String? name;

  Client({this.id, this.name});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
