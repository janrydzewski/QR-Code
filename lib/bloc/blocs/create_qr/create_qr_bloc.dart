import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';
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
      String result = createQrRepository.createEmailQrCode(event.emailModel);
      Hive.box("all").add(EmailHiveModel(event.emailModel, result));
      Hive.box("email").add(EmailHiveModel(event.emailModel, result));
      Hive.box("email").add(EmailHiveModel(event.emailModel, result));
      Hive.box("email").add(EmailHiveModel(event.emailModel, result));

      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateEventEvent(GenerateEventEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEventQrCode(event.eventModel);
      Hive.box("all").add(EventHiveModel(event.eventModel, result));
      Hive.box("event").add(EventHiveModel(event.eventModel, result));
      Hive.box("event").add(EventHiveModel(event.eventModel, result));
      Hive.box("event").add(EventHiveModel(event.eventModel, result));
      print(result);
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateSmsEvent(GenerateSmsEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createSmsQrCode(event.smsModel);
      Hive.box("all").add(SmsHiveModel(event.smsModel, result));
      Hive.box("sms").add(SmsHiveModel(event.smsModel, result));
      Hive.box("sms").add(SmsHiveModel(event.smsModel, result));
      Hive.box("sms").add(SmsHiveModel(event.smsModel, result));

      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateUrlEvent(GenerateUrlEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createUrlQrCode(event.urlModel);
      Hive.box("all").add(UrlHiveModel(event.urlModel, result));
      Hive.box("url").add(UrlHiveModel(event.urlModel, result));
      Hive.box("url").add(UrlHiveModel(event.urlModel, result));
      Hive.box("url").add(UrlHiveModel(event.urlModel, result));
      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateVCardEvent(GenerateVCardEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createVCardQrCode(event.vCardModel);
      Hive.box("all").add(VCardHiveModel(event.vCardModel, result));
      Hive.box("vcard").add(VCardHiveModel(event.vCardModel, result));
      Hive.box("vcard").add(VCardHiveModel(event.vCardModel, result));
      Hive.box("vcard").add(VCardHiveModel(event.vCardModel, result));

      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateWifiEvent(GenerateWifiEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createWifiQrCode(event.wifiModel);
      Hive.box("all").add(WifiHiveModel(event.wifiModel, result));
      Hive.box("wifi").add(WifiHiveModel(event.wifiModel, result));
      Hive.box("wifi").add(WifiHiveModel(event.wifiModel, result));
      Hive.box("wifi").add(WifiHiveModel(event.wifiModel, result));

      emit(CreateQrState(dataCode: result));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }
}
