import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

class DateFormatUtils {
  static void initialDateFormatting() {
    Intl.defaultLocale = "pt_BR";
    initializeDateFormatting();
  }

  static DateTime formatDateStringFromDateTime(String date) {
    initialDateFormatting();
    return intl.DateFormat("yyyy-MM-dd").parse(date);
  }

  static String formatDateTimeFromDateString(DateTime date) {
    initialDateFormatting();
    return intl.DateFormat('dd/MM/yyyy').format(date);
  }
}
