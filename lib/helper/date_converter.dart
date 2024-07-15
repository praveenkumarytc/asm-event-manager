import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String formatDateEvent(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm').format(dateTime);
  }

  static String estimatedDateBack(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String usaDateFormat(DateTime dateTime) {
    return DateFormat('MM-dd-yyyy').format(dateTime);
  }

  static String estimatedTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String estimatedDate1(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String estimatedDateWallet(DateTime dateTime) {
    return DateFormat('dd').format(dateTime);
  }

  static String estimatedDateWalletMonth(DateTime dateTime) {
    return DateFormat('MMM').format(dateTime);
  }

  static String orderDate(DateTime dateTime) {
    return DateFormat('dd MMM').format(dateTime);
  }

  static String estimatedDatenew(DateTime dateTime) {
    return DateFormat('dd MMM yyyy hh:mm a').format(dateTime);
  }

  static String estimatedDatenewone(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd:MM:yy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toUtc());
  }

  static String formatMonthName(DateTime dateTime) {
    return DateFormat('d MMMM, yyyy').format(dateTime);
  }

  static String formatRelativeDateTime(int millisecondsSinceEpoch) {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    final DateTime now = DateTime.now();

    if (dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year) {
      // Today
      return DateFormat.Hm().format(dateTime); // Format as HH:mm
    } else if (dateTime.add(const Duration(days: 1)).day == now.day && dateTime.add(const Duration(days: 1)).month == now.month && dateTime.add(const Duration(days: 1)).year == now.year) {
      // Yesterday
      return 'Yesterday';
    } else {
      // Older date
      return DateFormat('dd/MM/yyyy').format(dateTime); // Format as dd/MM/yyyy
    }
  }
}
