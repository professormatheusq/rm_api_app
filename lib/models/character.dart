import 'package:rm_api_app/models/character_helper.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterHelper origin;
  final CharacterHelper location;
  final String image;
  final List<String> episodes;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episodes,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String? ?? 'unknown',
      species: json['species'] as String? ?? 'unknown',
      type: json['type'] as String? ?? '',
      gender: json['gender'] as String? ?? 'unknown',
      image: json['image'] as String? ?? '',
      origin: CharacterHelper.fromJson(json['origin']),
      location: CharacterHelper.fromJson(json['location']),
      episodes:
          (json['episode'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      url: json['url'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );
  }
}
