
import 'package:equatable/equatable.dart';

class Tool extends Equatable{
  final String name;
  final String logoPath;

  final String slug;

  const Tool({
    required this.name,
    required this.logoPath,
    required this.slug,
  });  
  @override
  List<Object?> get props => [slug, name, logoPath];
}
