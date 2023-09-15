part of 'list_bloc.dart';

class ListState extends Equatable {
  final int index;
  const ListState({this.index = 0});
  
  @override
  List<Object> get props => [index];
}

