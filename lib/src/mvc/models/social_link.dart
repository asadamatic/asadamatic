import 'package:equatable/equatable.dart';

class SocialLink extends Equatable {
  final String imageAsset;
  final String profileUrl;

  const SocialLink({required this.imageAsset, required this.profileUrl});

  @override
  List<Object?> get props => [imageAsset, profileUrl];
}

const List<SocialLink> socialLinks = [
  SocialLink(
      imageAsset: 'assets/github.png',
      profileUrl: 'https://github.com/asadamatic'),
  SocialLink(
      imageAsset: 'assets/stack-overflow.png',
      profileUrl: 'https://stackoverflow.com/users/10285344/asad-hameed'),
  SocialLink(
      imageAsset: 'assets/linkedin.png',
      profileUrl: 'https://www.linkedin.com/in/asadamatic'),
];
