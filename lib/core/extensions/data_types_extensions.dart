import 'package:intl/intl.dart';

import './date_extensions.dart';

extension FormatAmount on num? {
  String get formatAmount => (this == null)
      ? "0"
      : NumberFormat.currency(
          name: '',
          // decimalDigits: Utils.isInteger(this!) ? 0 : 2,
        ).format(this);

  String get formatAmountWithName => (this == null)
      ? "0"
      : NumberFormat.currency(
          name: '₦',
          // decimalDigits: Utils.isInteger(this!) ? 0 : 2,
        ).format(this);

  String get getmaskText {
    List data = [];
    for (var element in toString().split('')) {
      element = '*';
      data.add(element);
    }
    return data.join();
  }
}

extension StringExtension on String? {
  String? get capitalize {
    if (this != null) {
      return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
    } else {
      return null;
    }
  }

  String get toSnakeCase {
    if (this == null) return "";
    String snakeCase = this!.replaceAll(RegExp(r'[^a-zA-Z0-9]+'), '_');
    snakeCase = snakeCase.toLowerCase();
    snakeCase = snakeCase.replaceAll(RegExp(r'^_+|_+$'), '');
    return snakeCase;
  }

  String get toInitial {
    if (this != null && this!.isNotEmpty) {
      final splt = this!.split(" ");
      if (splt.length > 1) {
        return "${splt.first[0]}${splt.last[0]}".toUpperCase();
      }
      return "${splt.first[0]}${splt.first[1]}".toUpperCase();
    } else {
      return "";
    }
  }

  DateTime? get toDate {
    if (this != null) {
      return DateFormat('yyyy-MM-dd').parse(this!);
    }
    return null;
  }

  String get toMonthDate {
    if (this != null) {
      return DateTime.parse(this!).toMonthDate;
    }
    return "";
  }

  String get toTime {
    if (this != null && this!.isNotEmpty) {
      return DateTime.parse(this!).toTime;
    }
    return "";
  }

  String get formatStringDate {
    if (this != null) {
      return DateTime.parse(this!).toDateTime;
    }
    return "";
  }

  String get formatStringToDate {
    if (this != null) {
      try {
        return DateTime.parse(this!).toDate;
      } catch (_) {
        return "";
      }
    }
    return "";
  }

  String get toDateMonthYear {
    if (this != null) {
      return DateTime.parse(this!).toDateMonthYear;
    }
    return "";
  }

  String? get toDateTimeYear {
    if (this != null) {
      return DateTime.parse(this!).toDateTimeYear;
    }
    return null;
  }

  String? get toDayDateTimeYear {
    if (this != null) {
      return DateTime.parse(this!).toDateTimeYear;
    }
    return null;
  }

  String masktext({
    int start = 0,
    int end = 7,
  }) {
    if (this == null) return '****';
    end = this!.length - 4;
    assert(this!.length > 10, throw "Value cannot be less than 11");
    List newChar = [];
    for (var val = 0; val < this!.length; val++) {
      var i = this!.split('')[val];
      if (val >= start && val <= end) {
        i = "*";
        newChar.add(i);
      } else {
        newChar.add(i);
      }
    }
    return newChar.join();
  }
}

class Utils {
  static isInteger(num value) => value is int || value == value.roundToDouble();
}
