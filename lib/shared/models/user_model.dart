import 'dart:convert';

class UserModel {
  final String uid;
  final String? name;
  final int score;

  UserModel({
    required this.uid,
    this.name,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
