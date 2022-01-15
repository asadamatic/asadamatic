class Package {
  final String? name;
  final String? likes;
  final String? pubPoints;
  final String? popularity;

  Package({this.name, this.likes, this.pubPoints, this.popularity});

  factory Package.fromJson(json) {
    return Package(
      name: json['name'],
      likes: json['likes'].toString(),
      pubPoints: json['pub_points'].toString(),
      popularity: json['popularity'].toString(),
    );
  }
}
