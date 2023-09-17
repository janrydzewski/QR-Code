part of 'list_bloc.dart';

class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class ChangeIndexEvent extends ListEvent {
  final int newIndex;
  const ChangeIndexEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class DeleteElementFromListEvent extends ListEvent {
  final String data;
  final String type;
  const DeleteElementFromListEvent(this.data, this.type);

  @override
  List<Object> get props => [data, type];
}