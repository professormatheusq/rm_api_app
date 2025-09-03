class CharacterHelper {
  final String name;
  final String url;

  CharacterHelper({required this.name, required this.url});

  factory CharacterHelper.fromJson(Map<String, dynamic> json) {
    return CharacterHelper(
      name: json['name'] as String? ?? 'unknown',
      url: json['url'] as String? ?? 'unknown',
    );
  }
}
