import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/models/models.dart';
import 'package:qr_code/repositories/repositories.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListRepository listRepository;
  ListBloc({required this.listRepository}) : super(const ListState()) {
    on<ChangeIndexEvent>(_onChangeIndexEvent);
  }

  _onChangeIndexEvent(ChangeIndexEvent event, Emitter<ListState> emit) {
    emit(const ListLoading());
    switch (event.newIndex) {
      case 0:
        final emailList =
            List<EmailHiveModel>.from(listRepository.getEmailQrList());
        final eventList =
            List<EventHiveModel>.from(listRepository.getEventQrList());
        final smsList = List<SmsHiveModel>.from(listRepository.getSmsQrList());
        final urlList = List<UrlHiveModel>.from(listRepository.getUrlQrList());
        final vcardList =
            List<VCardHiveModel>.from(listRepository.getVCardQrList());
        final wifiList =
            List<WifiHiveModel>.from(listRepository.getWifiQrList());
        emit(ListCombinedState(emailList, eventList, smsList, urlList,
            vcardList, wifiList, event.newIndex));
      case 1:
        final qrList =
            List<EmailHiveModel>.from(listRepository.getEmailQrList());
        emit(ListEmailState(qrList, event.newIndex));
        break;
      case 2:
        final qrList =
            List<EventHiveModel>.from(listRepository.getEventQrList());
        emit(ListEventState(qrList, event.newIndex));
        break;
      case 3:
        final qrList = List<SmsHiveModel>.from(listRepository.getSmsQrList());
        emit(ListSmsState(qrList, event.newIndex));
        break;
      case 4:
        final qrList = List<UrlHiveModel>.from(listRepository.getUrlQrList());
        emit(ListUrlState(qrList, event.newIndex));
        break;
      case 5:
        final qrList =
            List<VCardHiveModel>.from(listRepository.getVCardQrList());
        emit(ListVCardState(qrList, event.newIndex));
        break;
      case 6:
        final qrList = List<WifiHiveModel>.from(listRepository.getWifiQrList());
        emit(ListWifiState(qrList, event.newIndex));
        break;
      default:
        emit(const ListState(index: 0));
    }
  }
}
