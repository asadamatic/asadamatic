import 'package:equatable/equatable.dart';

class Score extends Equatable {
  final String title;
  final int score;
  final String? profileUrl;
  const Score({required this.title, required this.score, this.profileUrl});

  @override
  List<Object?> get props => [title, profileUrl];
}
