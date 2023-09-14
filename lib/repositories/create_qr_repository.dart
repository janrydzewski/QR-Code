class CreateQrRepository{
  const CreateQrRepository();

  String createEmailQrCode(String email, String subject, String message){
    return "mailto:${email}?subject=${subject}&body=${message}";
  }

  String createEventQrCode(String title, String startDate, String endDate){
    return "BEGIN:VEVENT\n""SUMMARY:${title}\n""DTSTART:${startDate}\n""DTEND:${endDate}\n""END:VEVENT";
  }

  String createSmsQrCode(String phoneNumber, String message){
    return "SMSTO:${phoneNumber}:${message}";
  }

  String createUrlQrCode(String url){
    return "https://${url}/";
  }

  String createVCardQrCode(String firstName, String lastName, String nickname, String url, String street, String city, String country, String birthDay, String note){
    return "MECARD:N:${lastName},${firstName};NICKNAME:${nickname};URL:${url};ADR:${street},${city},${country};BDAY:${birthDay};NOTE:${note};;";
  }

  String createWifiQrCode(String networkName, String password, String security){
    return "WIFI:S:${networkName};T:${security};P:${password};;";
  }
}