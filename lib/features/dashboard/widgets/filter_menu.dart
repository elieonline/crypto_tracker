import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({
    super.key,
    this.value,
    this.onChanged,
  });
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final List<String> filters = [
      "Name",
      "Price",
      "Last 24 hours",
    ];
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in filters) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(item, style: textTheme(context).textSemiBold),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != filters.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(color: Color(0xFFE6E6E6), thickness: 0.3, height: 0),
            ),
        ],
      );
    }

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: value,
        items: menuItems,
        onChanged: onChanged,
        barrierColor: const Color(0xFF1E1E1E).withOpacity(0.26),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          width: 150,
          maxHeight: MediaQuery.of(context).size.height / 2,
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColors(context).formBackground,
          ),
          offset: const Offset(0, -10),
        ),
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero, height: 25),
        customButton: Container(
          height: 32,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          constraints: const BoxConstraints(minWidth: 105),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: appColors(context).formBackground,
          ),
          child: Row(
            children: [
              Text("$value", style: textTheme(context).textMedium),
              const Spacing.mediumWidth(),
              const Icon(BIcons.arrow_down_2, size: 16)
            ],
          ),
        ),
      ),
    );
  }
}
