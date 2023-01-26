import 'package:flutter/material.dart';

class PokedexSpeciesInfoModel {
  final String? description;

  PokedexSpeciesInfoModel({this.description});

  factory PokedexSpeciesInfoModel.fromJson(Map<String, dynamic> json) {
    return PokedexSpeciesInfoModel(
        description: json['flavor_text_entries'][0]['flavor_text']);
  }
}
