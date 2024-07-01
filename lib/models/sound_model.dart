class SoundModel
{
  final String name;
  final String url;
  final String coverUrl;

  SoundModel({required this.name, required this.url, required this.coverUrl});

  factory SoundModel.fromJson(Map<String, dynamic> json) {
    return SoundModel(
        name: json['title'],
        url: json['preview'],
        coverUrl: json["artist"]['picture_medium']);
}}