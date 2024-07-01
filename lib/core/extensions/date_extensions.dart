import 'package:intl/intl.dart';

extension ToDateTime on DateTime? {
  String get toDateTime => (this == null) ? "" : DateFormat('MMM d, hh:mm a').format(this!);
  String get toTime => (this == null) ? "" : DateFormat('hh:mm a').format(this!);

  String get toDate => (this == null) ? "" : DateFormat('MMMM d, y').format(this!);
  String get toMonthDate => (this == null) ? "" : DateFormat('d MMMM, y').format(this!);
  String get toDateTimeYear => (this == null) ? "" : DateFormat('EEE, MMM d y hh:mm a').format(this!);
  String get toDayDateTimeYear => (this == null) ? "" : DateFormat('MMM d, y').format(this!);

  String get toDateMonthYear => (this == null) ? "" : DateFormat('dd-MM-yyyy').format(this!);
  String get toDobDate => (this == null) ? "" : DateFormat('yyyy-MM-dd').format(this!);
  String get toFilterDate => (this == null) ? "" : DateFormat('dd MMM, yy').format(this!);
}
