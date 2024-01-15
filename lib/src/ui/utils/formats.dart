import 'package:intl/intl.dart';

String formatDate(DateTime? date, {String format = "d MMMM"}) {
  if (date == null) {
    return "Sin fecha";
  }
  return DateFormat(format, "es").format(date);
}
