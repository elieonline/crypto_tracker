import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../core/utils/utils.dart';

class DateFilter extends ConsumerStatefulWidget {
  const DateFilter({
    super.key,
    this.startDate,
    this.endDate,
    this.firstDate,
    this.lastDate,
    this.onSelected,
    this.onCleared,
    this.multiple = true,
  });
  final void Function(DateTime startDate, DateTime endDate)? onSelected;
  final void Function()? onCleared;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool multiple;

  @override
  ConsumerState<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends ConsumerState<DateFilter> {
  List<DateTime?> _dates = [];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacing.height(20),
        if (widget.multiple) ...[
          Row(
            children: [
              const Spacing.width(20),
              Text(
                "Kindly select a date range to filter",
                style: textTheme.textMedium.copyWith(color: appColors(context).error),
              ),
            ],
          ),
          const Spacing.height(20),
        ],
        //
        CalendarDatePicker2WithActionButtons(
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: widget.multiple ? CalendarDatePicker2Type.range : CalendarDatePicker2Type.single,
            customModePickerIcon: const SizedBox(),
            centerAlignModePicker: true,
            firstDayOfWeek: 1,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            weekdayLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
            selectedDayHighlightColor: Colors.grey,
            controlsTextStyle: textTheme.text2Regular.copyWith(fontSize: 20),
            okButtonTextStyle: textTheme.text2Regular.copyWith(color: appColors(context).primary),
            dayBuilder: _dayBuilder,
            buttonPadding: const EdgeInsets.only(bottom: 20, right: 20),
            modePickerTextHandler: ({required monthDate}) {
              DateFormat dateFormat = DateFormat("MMMM");
              if (monthDate.year != DateTime.now().year) {
                return "${dateFormat.format(monthDate)}, ${monthDate.year}";
              }
              return dateFormat.format(monthDate);
            },
            lastMonthIcon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.6, color: const Color(0xFFE8ECF4)),
              ),
              child: const Icon(
                Icons.keyboard_arrow_left,
                size: 12,
                color: Colors.black,
              ),
            ),
            nextMonthIcon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.6, color: const Color(0xFFE8ECF4)),
              ),
              child: const Icon(
                Icons.keyboard_arrow_right,
                size: 12,
                color: Colors.black,
              ),
            ),
            cancelButton: Text(_dates.length == 2 ? 'CLEAR' : 'CANCEL'),
          ),
          value: _dates,
          onValueChanged: (dates) => _dates = dates,
          onCancelTapped: () {
            if (_dates.length == 2 && widget.onCleared != null) {
              widget.onCleared!();
            }
            Navigator.pop(context);
          },
          onOkTapped: () {
            if (_dates.isNotEmpty) {
              if (widget.onSelected != null) {
                widget.onSelected!(_dates.first!, _dates.last!);
              }
              if (!widget.multiple) {
                Navigator.pop(context);
              } else if (widget.multiple && _dates.length == 2) {
                Navigator.pop(context);
              }
            }
          },
        )
      ],
    );
  }

  Widget? _dayBuilder({
    required DateTime date,
    BoxDecoration? decoration,
    bool? isDisabled,
    bool? isSelected,
    bool? isToday,
    TextStyle? textStyle,
  }) {
    final textTheme = Theme.of(context).textTheme;
    DateFormat dateFormat = DateFormat("dd");
    if (isToday == true && isSelected == false) {
      return Container(
        decoration: decoration?.copyWith(border: Border.all(color: appColors(context).primary)),
        child: Center(
          child: Text(
            dateFormat.format(date),
            style: textTheme.textRegular.copyWith(
              fontSize: 10,
              color: appColors(context).onSurface.withOpacity(isDisabled == true ? 0.4 : 1),
            ),
          ),
        ),
      );
    }
    if (isSelected == true) {
      return Container(
        decoration: decoration?.copyWith(color: appColors(context).primary),
        child: Center(
          child: Text(
            dateFormat.format(date),
            style: textTheme.textRegular.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Text(
        dateFormat.format(date),
        style: textTheme.textRegular.copyWith(
          fontSize: 10,
          color: appColors(context).onSurface.withOpacity(isDisabled == true ? 0.4 : 1),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (!widget.multiple) {
      if (widget.startDate != null) {
        _dates = [widget.startDate];
      }
    } else {
      if (widget.startDate != null && widget.endDate != null) {
        _dates = [widget.startDate, widget.endDate];
      }
    }
  }
}
