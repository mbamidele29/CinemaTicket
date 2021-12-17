import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String name, image;

  Cast(this.name, this.image);

  @override
  List<Object> get props => [name, image];
}