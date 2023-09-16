part of 'list_bloc.dart';

class ListState extends Equatable {
  final int index;
  const ListState({this.index = 0});

  @override
  List<Object> get props => [index];
}

class ListEmailState extends ListState{
  final int index;
  final List<EmailHiveModel> qrList;

  const ListEmailState(this.qrList, this.index);
}

class ListEventState extends ListState{
  final int index;
  final List<EventHiveModel> qrList;

  const ListEventState(this.qrList, this.index);
}


class ListSmsState extends ListState{
  final int index;
  final List<SmsHiveModel> qrList;

  const ListSmsState(this.qrList, this.index);
}


class ListUrlState extends ListState{
  final int index;
  final List<UrlHiveModel> qrList;

  const ListUrlState(this.qrList, this.index);
}


class ListVCardState extends ListState{
  final int index;
  final List<VCardHiveModel> qrList;

  const ListVCardState(this.qrList, this.index);
}


class ListWifiState extends ListState{
  final int index;
  final List<WifiHiveModel> qrList;

  const ListWifiState(this.qrList, this.index);
}
