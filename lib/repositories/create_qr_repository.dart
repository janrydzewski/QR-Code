class CreateQrRepository{
  const CreateQrRepository();

  String createEmailQrCode(String email, String subject, String message){
    return "MATMSG:TO:${email};SUB:${subject};BODY:${message};;";
  }

  String createFacebookQrCode(String link){
    return "https://${link}/";
  }

  String createSmsQrCode(String phoneNumber, String message){
    return "SMSTO:${phoneNumber}:${message}";
  }

  String createUrlQrCode(String url){
    return "https://\${url}/";
  }

  String createVCardQrCode(String firstName, String lastName, String nickname, String url, String street, String city, String state, String zipCode, String country, String birthDay, String note){
    return "MECARD:N:${lastName},${firstName};NICKNAME:${nickname};URL:${url};ADR:,,${street},${city},${state},${zipCode},${country};BDAY:${birthDay};NOTE:${note};;";
  }

  String createWifiQrCode(String networkName, String password, String security){
    return "WIFI:S:${networkName};T:${security};P:${password};;";
  }
}