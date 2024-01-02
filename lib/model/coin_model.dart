import 'dart:convert';

Coin coinFromJson(String str) => Coin.fromJson(json.decode(str));
String coinToJson(Coin data) => json.encode(data.toJson());

class Coin {
  int count;
  String name;
  int age;

  Coin({
    required this.count,
    required this.name,
    required this.age,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    count: json["count"],
    name: json["name"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "name": name,
    "age": age,
  };
}