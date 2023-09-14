import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/repositories/repositories.dart';

part 'create_qr_event.dart';
part 'create_qr_state.dart';

class CreateQrBloc extends Bloc<CreateQrEvent, CreateQrState> {
  final CreateQrRepository createQrRepository;
  CreateQrBloc({required this.createQrRepository})
      : super(const CreateQrState()) {
    on<GenerateEmailEvent>(_onGenerateEmailEvent);
    on<GenerateFacebookEvent>(_onGenerateFacebookEvent);
    on<GenerateSmsEvent>(_onGenerateSmsEvent);
    on<GenerateUrlEvent>(_onGenerateUrlEvent);
    on<GenerateVCardEvent>(_onGenerateVCardEvent);
    on<GenerateWifiEvent>(_onGenerateWifiEvent);
  }

  _onGenerateEmailEvent(GenerateEmailEvent event, Emitter<CreateQrState> emit) {
    emit(CreateQrLoading());
    try {} catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateFacebookEvent(
      GenerateFacebookEvent event, Emitter<CreateQrState> emit) {
    emit(CreateQrLoading());
    try {} catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateSmsEvent(GenerateSmsEvent event, Emitter<CreateQrState> emit) {
    emit(CreateQrLoading());
    try {} catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateUrlEvent(GenerateUrlEvent event, Emitter<CreateQrState> emit) {
    emit(CreateQrLoading());
    try {} catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateVCardEvent(GenerateVCardEvent event, Emitter<CreateQrState> emit) {
    emit(CreateQrLoading());
    try {} catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateWifiEvent(GenerateWifiEvent event, Emitter<CreateQrState> emit) {
    emit(CreateQrLoading());
    try {} catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }
}
