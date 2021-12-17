import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final String distribution;
  final String director, year, duration;

  Crew({this.distribution, this.director, this.year, this.duration});

  @override
  List<Object> get props => [distribution, director, year, duration];

  factory Crew.initial()=>Crew(director: '', distribution: '', duration: '', year: '');
}