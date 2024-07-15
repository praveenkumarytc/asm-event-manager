// ignore_for_file: file_names

class PhonePeConstants {
  PhonePeConstants(this.phonepeEnvironment);

  final PhonepeEnvironment phonepeEnvironment;

  String get merchantId {
    return phonepeEnvironment == PhonepeEnvironment.PRODUCTION ? "EKSHOPONLINE" : 'PGTESTPAYUAT';
  }

  static const String callBackUrl = "https://webhook.site/callback-url";
  static const String apiEndPoint = '/pg/v1/pay';

  String get saltKey => phonepeEnvironment == PhonepeEnvironment.PRODUCTION ? "955fe351-e191-406c-8dd4-f0d5185a74d2" : "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";

  String get saltIndex => phonepeEnvironment == PhonepeEnvironment.PRODUCTION ? "3" : "1";

  String get environmentValue => phonepeEnvironment.name.toUpperCase();

  static const String appId = 'dbf9f6a2f6c147d4b462be24561bd03b';
  static final Map<String, String> headers = {};
  static const bool enableLogging = true;
}

enum PhonepeEnvironment {
  UAT_SIM,
  PRODUCTION
}
