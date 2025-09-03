import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rm_api_app/models/character.dart';

class RmService {
  String url = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> fetchCharacters() async {
  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      debugPrint("[${response.statusCode}] Não foi possível buscar os dados da API");
      return <Character>[];
    }

    final decoded = jsonDecode(response.body);

    final List<dynamic> results = List<dynamic>.from(decoded['results'] as List);

    final List<Character> characters = results
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);

    return characters;
  } catch (e, st) {
    debugPrint('Erro ao buscar personagens: $e\n$st');
    return <Character>[];
  }
}

}