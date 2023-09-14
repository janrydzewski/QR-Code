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

class CreateQrError extends CreateQrState {
  final String message;

  const CreateQrError({required this.message});
}
