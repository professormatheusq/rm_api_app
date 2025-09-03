import 'package:flutter/material.dart';
import 'package:rm_api_app/models/character.dart';
import 'package:rm_api_app/services/rm_service.dart';

class CharacterListViewmodel extends ChangeNotifier {
  final RmService _rmService = RmService();
  List<Character> _characters = [];
  bool _isLoading = false;
  String? _error;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCharacters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _characters = await _rmService.fetchCharacters();
    } catch (e) {
      _characters = [];
      _error = e.toString();
      debugPrint('Erro ao buscar personagens: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
