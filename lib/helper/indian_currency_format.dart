import 'package:intl/intl.dart';

final NumberFormat indianNumberFormat = NumberFormat('#,##,##,##,##,###', 'en_IN'); //13,234

final NumberFormat rupeeFormatter = NumberFormat.currency(locale: 'en_IN', symbol: '');

String formatAmount(double amount) {
  if (amount < 100000) {
    NumberFormat rupeeFormatter = NumberFormat.currency(locale: 'en_IN', symbol: '');
    return rupeeFormatter.format(amount);
  } else {
    double lakhs = amount / 100000;
    NumberFormat lakhsFormatter = NumberFormat('#L', 'en_IN');
    return lakhsFormatter.format(lakhs);
  }
}
