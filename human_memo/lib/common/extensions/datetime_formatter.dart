import 'package:intl/date_symbol_data_local.dart';
import "package:intl/intl.dart";

extension Format on DateTime {
  String yyyyMMdd() {
    initializeDateFormatting("ja_JP");

    final formatter = DateFormat('yyyy年MM月dd日', "ja_JP");
    return formatter.format(this);
  }
}
