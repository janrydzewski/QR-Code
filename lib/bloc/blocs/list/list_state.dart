part of 'list_bloc.dart';

class ListState extends Equatable {
  final int index;
  const ListState({this.index = 0});

  @override
  List<Object> get props => [index];
}

class ListEmailState extends ListState {
  final int index;
  final List<EmailHiveModel> qrList;

  const ListEmailState(this.qrList, this.index);

  @override
  List<Object> get props => [index, qrList];
}

class ListEventState extends ListState {
  final int index;
  final List<EventHiveModel> qrList;

  const ListEventState(this.qrList, this.index);

  @override
  List<Object> get props => [index, qrList];
}

class ListSmsState extends ListState {
  final int index;
  final List<SmsHiveModel> qrList;

  const ListSmsState(this.qrList, this.index);

  @override
  List<Object> get props => [index, qrList];
}

class ListUrlState extends ListState {
  final int index;
  final List<UrlHiveModel> qrList;

  const ListUrlState(this.qrList, this.index);

  @override
  List<Object> get props => [index, qrList];
}

class ListVCardState extends ListState {
  final int index;
  final List<VCardHiveModel> qrList;

  const ListVCardState(this.qrList, this.index);

  @override
  List<Object> get props => [index, qrList];
}

class ListWifiState extends ListState {
  final int index;
  final List<WifiHiveModel> qrList;

  const ListWifiState(this.qrList, this.index);

  @override
  List<Object> get props => [index, qrList];
}

class ListCombinedState extends ListState {
  final int index;
  final List<EmailHiveModel> emailList;
  final List<EventHiveModel> eventList;
  final List<SmsHiveModel> smsList;
  final List<UrlHiveModel> urlList;
  final List<VCardHiveModel> vcardList;
  final List<WifiHiveModel> wifiList;

  const ListCombinedState(this.emailList, this.eventList, this.smsList, this.urlList, this.vcardList, this.wifiList, this.index);

  @override
  List<Object> get props => [index, emailList, eventList, smsList, urlList, vcardList, wifiList];
}

class ListLoading extends ListState {
  const ListLoading();

  @override
  List<Object> get props => [];
}
