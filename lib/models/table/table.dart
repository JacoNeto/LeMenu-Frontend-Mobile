part 'table.g.dart';

class Table {
  int? id;
  String? code;
  bool? isOpen;

  Table({this.id, this.code, this.isOpen});

  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);
  Map<String, dynamic> toJson() => _$TableToJson(this);
}
