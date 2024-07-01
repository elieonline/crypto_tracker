import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
import '../core/utils/spacing.dart';

class AppBottom {
  static Future<void> sheet({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool showClose = false,
  }) async {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      enableDrag: isDismissible,
      // backgroundColor: appColors(context).scaffold2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      isScrollControlled: true,
      isDismissible: isDismissible,
      builder: (ctx) => Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: appColors(context).surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isDismissible) ...[
                const Spacing.mediumHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacing.bigWidth(),
                    Container(
                      height: 5,
                      width: 63,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    if (showClose) ...[
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close),
                        ),
                      )
                    ] else ...[
                      const Spacing.smallWidth(),
                    ]
                  ],
                ),
                const Spacing.mediumHeight(),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}
