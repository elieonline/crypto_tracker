import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:flutter/material.dart';

import '../core/utils/utils.dart';

class AppDialog {
  static Future<void> show({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    EdgeInsets? insetPadding,
    double? borderRadius,
  }) async {
    return showDialog(
      useRootNavigator: true,
      context: context,
      barrierDismissible: isDismissible,
      builder: (ctx) => Dialog(
        insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        child: child,
      ),
    );
  }
}

class DialogTemplate extends StatelessWidget {
  const DialogTemplate({
    super.key,
    required this.children,
    this.hPadding,
    this.padding,
  });
  final List<Widget> children;
  final double? hPadding;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: hPadding ?? 40.0, vertical: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        padding: padding ?? const EdgeInsets.all(Dimensions.big),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    this.title,
    this.message,
    this.doneButtonText,
    this.cancelButtonText,
    this.onCancelButton,
    this.onDoneButton,
  });
  final String? title, message;
  final String? doneButtonText, cancelButtonText;
  final void Function()? onDoneButton, onCancelButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DialogTemplate(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 22, right: 22),
          child: Column(
            children: [
              Text(
                title ?? "",
                style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const Spacing.height(15),
              Text(
                message ?? "",
                style: textTheme.bodySmall!.copyWith(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Spacing.height(10),
        const Divider(color: Color(0xFFE6E6E6), thickness: 0.5, height: 0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onCancelButton ?? () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14)),
                  ),
                  minimumSize: const Size(0, 50),
                ),
                icon: const Icon(
                  Icons.close,
                  size: 18,
                  color: Color(0xFFFF0000),
                ),
                label: Text(
                  cancelButtonText ?? "Cancel",
                  style: textTheme.text.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
              child: VerticalDivider(color: Color(0xFFE6E6E6), width: 0.5),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(14)),
                ),
                child: ElevatedButton.icon(
                  onPressed: onDoneButton,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(14)),
                    ),
                    minimumSize: const Size(0, 50),
                  ),
                  icon: Icon(
                    Icons.done,
                    size: 18,
                    color: appColors(context).success,
                  ),
                  label: Text(
                    doneButtonText ?? "OK",
                    style: textTheme.text.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
