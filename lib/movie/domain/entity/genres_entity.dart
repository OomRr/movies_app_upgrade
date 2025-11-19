import 'package:equatable/equatable.dart';

class GenresEntity extends Equatable {
  final String name;
  final int id;

  const GenresEntity({required this.name, required this.id});

  @override
  List<Object> get props => [name, id];
}