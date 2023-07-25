// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome02> welcome02FromJson(String str) => List<Welcome02>.from(json.decode(str).map((x) => Welcome02.fromJson(x)));

String welcomeToJson(List<Welcome02> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome02 {
  String id;
  String content;
  String author;
  List<String> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  Welcome02({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Welcome02.fromJson(Map<String, dynamic> json) => Welcome02(
    id: json["_id"],
    content: json["content"],
    author: json["author"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    authorSlug: json["authorSlug"],
    length: json["length"],
    dateAdded: DateTime.parse(json["dateAdded"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "author": author,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "authorSlug": authorSlug,
    "length": length,
    "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
  };
}
