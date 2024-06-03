
import 'package:equatable/equatable.dart';

class Tool extends Equatable {
  final String name;
  final String logoPath;
  final String? _darkModeLogoPath;
  final String slug;
  final String websiteUrl;
  final String? githubRepoUrl;

  const Tool({
    required this.name,
    required this.logoPath,
    required this.slug,
    required this.websiteUrl,
    this.githubRepoUrl,
    String? darkModeLogoPath,
  }) : _darkModeLogoPath = darkModeLogoPath;

  String get darkModeLogoPath => _darkModeLogoPath ?? logoPath;

  @override
  List<Object?> get props => [slug, name, logoPath, websiteUrl, githubRepoUrl];
}
