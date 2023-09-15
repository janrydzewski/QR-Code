import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(const ListState()) {
    on<ChangeIndexEvent>(_onChangeIndexEvent);
  }

  _onChangeIndexEvent(ChangeIndexEvent event, Emitter<ListState> emit) {
    emit(ListState(index: event.newIndex));
  }
}
