import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  daySuffix(day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  final formattedDate = DateFormat('MMMM d, yyyy, h:mm:ssa').format(dateTime);
  final day = dateTime.day;
  final dayWithSuffix = '$day${daySuffix(day)}';
  return formattedDate.replaceFirst(RegExp(r'\d+'), dayWithSuffix);
}

class ThemeColors {
  static const mainColor = 0xffE7F0DC;
}

const currencyPH = "₱";
