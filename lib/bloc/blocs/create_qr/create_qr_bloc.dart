import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/repositories/repositories.dart';

part 'create_qr_event.dart';
part 'create_qr_state.dart';

class CreateQrBloc extends Bloc<CreateQrEvent, CreateQrState> {
  final CreateQrRepository createQrRepository;
  CreateQrBloc({required this.createQrRepository})
      : super(const CreateQrState()) {
    on<GenerateEmailEvent>(_onGenerateEmailEvent);
    on<GenerateEventEvent>(_onGenerateEventEvent);
    on<GenerateSmsEvent>(_onGenerateSmsEvent);
    on<GenerateUrlEvent>(_onGenerateUrlEvent);
    on<GenerateVCardEvent>(_onGenerateVCardEvent);
    on<GenerateWifiEvent>(_onGenerateWifiEvent);
  }

  _onGenerateEmailEvent(GenerateEmailEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEmailQrCode(
        event.email,
        event.subject,
        event.message,
      );
      print(result);
      Hive.box("all").add(result);
      Hive.box("email").add(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateEventEvent(GenerateEventEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEventQrCode(
        event.title,
        event.startDate,
        event.endDate,
      );
      Hive.box("all").add(result);
      Hive.box("event").add(result);
      print(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateSmsEvent(GenerateSmsEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createSmsQrCode(
        event.phoneNumber,
        event.message,
      );
      print(result);
      Hive.box("sms").add(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateUrlEvent(GenerateUrlEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createUrlQrCode(
        event.url,
      );
      print(result);
      Hive.box("all").add(result);
      Hive.box("url").add(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateVCardEvent(GenerateVCardEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createVCardQrCode(
        event.firstName,
        event.lastName,
        event.nickname,
        event.url,
        event.street,
        event.city,
        event.country,
        event.birthDay,
        event.note,
      );
      print(result);
      Hive.box("all").add(result);
      Hive.box("vcard").add(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateWifiEvent(GenerateWifiEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createWifiQrCode(
        event.networkName,
        event.password,
        event.security,
      );
      print(result);
      Hive.box("all").add(result);
      Hive.box("wifi").add(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }
}
