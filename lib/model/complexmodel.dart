// To parse this JSON data, do
//
//     final complexapimodel = complexapimodelFromJson(jsonString);

import 'dart:convert';

Complexapimodel complexapimodelFromJson(String str) => Complexapimodel.fromJson(json.decode(str));

String complexapimodelToJson(Complexapimodel data) => json.encode(data.toJson());

class Complexapimodel {
  int count;
  List<Entry> entries;

  Complexapimodel({
    required this.count,
    required this.entries,
  });

  factory Complexapimodel.fromJson(Map<String, dynamic> json) => Complexapimodel(
    count: json["count"],
    entries: List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
  };
}

class Entry {
  String api;
  String description;
  String auth;
  bool https;
  String cors;
  String link;
  String category;

  Entry({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
    api: json["API"],
    description: json["Description"],
    auth: json["Auth"],
    https: json["HTTPS"],
    cors: json["Cors"],
    link: json["Link"],
    category: json["Category"],
  );

  Map<String, dynamic> toJson() => {
    "API": api,
    "Description": description,
    "Auth": auth,
    "HTTPS": https,
    "Cors": cors,
    "Link": link,
    "Category": category,
  };
}
