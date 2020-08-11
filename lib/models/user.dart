import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
class User {
  String nickName;
  int age;

  User(this.nickName, this.age);

  User.fromJson(Map<String, dynamic> json) {
    nickName = json["nickName"] as String;
    age = json["age"] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> model = new Map<String, dynamic>();
    model["nickName"] = nickName;
    model["age"] = age;
    return model;
  }
}
