part of 'create_qr_bloc.dart';

class CreateQrState extends Equatable {
  final String dataCode;

  const CreateQrState({this.dataCode = ""});

  @override
  List<Object> get props => [dataCode];
}

class CreateQrLoading extends CreateQrState {
  const CreateQrLoading();
}

class CreateEmailState extends CreateQrState {
  final EmailHiveModel model;

  const CreateEmailState({required this.model});
}

class CreateEventState extends CreateQrState {
  final EventHiveModel model;

  const CreateEventState({required this.model});
}

class CreateSmsState extends CreateQrState {
  final SmsHiveModel model;

  const CreateSmsState({required this.model});
}

class CreateUrlState extends CreateQrState {
  final UrlHiveModel model;

  const CreateUrlState({required this.model});
}

class CreateVCardState extends CreateQrState {
  final VCardHiveModel model;

  const CreateVCardState({required this.model});
}

class CreateWifiState extends CreateQrState {
  final WifiHiveModel model;

  const CreateWifiState({required this.model});
}

class CreateQrError extends CreateQrState {
  final String message;

  const CreateQrError({required this.message});
}
