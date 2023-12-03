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
    on<ShowEmailEvent>(_onShowEmailEvent);
    on<ShowEventEvent>(_onShowEventEvent);
    on<ShowSmsEvent>(_onShowSmsEvent);
    on<ShowUrlEvent>(_onShowUrlEvent);
    on<ShowVCardEvent>(_onShowVCardEvent);
    on<ShowWifiEvent>(_onShowWifiEvent);
  }

  _onGenerateEmailEvent(GenerateEmailEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEmailQrCode(event.emailModel);
      Hive.box("emailBox").add(EmailHiveModel(event.emailModel, result));
      emit(CreateEmailState(model: EmailHiveModel(event.emailModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateEventEvent(GenerateEventEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEventQrCode(event.eventModel);
      Hive.box("eventBox").add(EventHiveModel(event.eventModel, result));
      print(result);
      emit(CreateEventState(model: EventHiveModel(event.eventModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateSmsEvent(GenerateSmsEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createSmsQrCode(event.smsModel);
      Hive.box("smsBox").add(SmsHiveModel(event.smsModel, result));
      emit(CreateSmsState(model: SmsHiveModel(event.smsModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateUrlEvent(GenerateUrlEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createUrlQrCode(event.urlModel);
      Hive.box("urlBox").add(UrlHiveModel(event.urlModel, result));
      emit(CreateUrlState(model: UrlHiveModel(event.urlModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateVCardEvent(GenerateVCardEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createVCardQrCode(event.vCardModel);
      Hive.box("vcardBox").add(VCardHiveModel(event.vCardModel, result));
      emit(CreateVCardState(model: VCardHiveModel(event.vCardModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onGenerateWifiEvent(GenerateWifiEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createWifiQrCode(event.wifiModel);
      Hive.box("wifiBox").add(WifiHiveModel(event.wifiModel, result));
      emit(CreateWifiState(model: WifiHiveModel(event.wifiModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onShowEmailEvent(ShowEmailEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEmailQrCode(event.emailModel);
      emit(CreateEmailState(model: EmailHiveModel(event.emailModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onShowEventEvent(ShowEventEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createEventQrCode(event.eventModel);
      emit(CreateEventState(model: EventHiveModel(event.eventModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onShowSmsEvent(ShowSmsEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createSmsQrCode(event.smsModel);
      emit(CreateSmsState(model: SmsHiveModel(event.smsModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onShowUrlEvent(ShowUrlEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createUrlQrCode(event.urlModel);
      emit(CreateUrlState(model: UrlHiveModel(event.urlModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onShowVCardEvent(ShowVCardEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createVCardQrCode(event.vCardModel);
      emit(CreateVCardState(model: VCardHiveModel(event.vCardModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }

  _onShowWifiEvent(ShowWifiEvent event, Emitter<CreateQrState> emit) {
    emit(const CreateQrLoading());
    try {
      String result = createQrRepository.createWifiQrCode(event.wifiModel);
      emit(CreateWifiState(model: WifiHiveModel(event.wifiModel, result)));
    } catch (e) {
      emit(CreateQrError(message: e.toString()));
    }
  }
}
