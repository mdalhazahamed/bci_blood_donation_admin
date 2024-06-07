import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IdTypeModel {
  String? id;
  String? type;

  IdTypeModel({this.id, this.type});

  factory IdTypeModel.fromJson(Map<String, dynamic> json) {
    return IdTypeModel(
      id: json['id'],
      type: json['type'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
    };
  }
}
