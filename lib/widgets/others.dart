import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'button_widget.dart';

class TileSuffix extends StatelessWidget {
  const TileSuffix({
    super.key,
    this.left = false,
    this.iconColor,
  });
  final bool left;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.6, color: const Color(0xFFE8ECF4)),
      ),
      child: Icon(
        left ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
        size: 12,
        color: iconColor ?? Colors.black,
      ),
    );
  }
}

class ListRow extends StatelessWidget {
  const ListRow({
    super.key,
    required this.title,
    this.value,
    this.child,
    this.titleStyle,
    this.valueStyle,
    this.gap,
  });
  final String title;
  final String? value;
  final Widget? child;
  final TextStyle? titleStyle, valueStyle;
  final Widget? gap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: titleStyle ?? textTheme.textRegular,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
            const Spacing.mediumWidth(),
            Expanded(
              flex: 3,
              child: child != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [child!],
                    )
                  : Text(
                      value ?? '',
                      style: valueStyle ?? textTheme.textRegular.copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.end,
                    ),
            )
          ],
        ),
        gap ?? const Spacing.height(20),
      ],
    );
  }
}

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    this.onDone,
    this.button,
  });
  final String? title, message, buttonText;
  final void Function()? onDone;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imgPath('success.gif'), width: 250),
            Text(
              title ?? "Success!",
              style: textTheme.header1Bold.copyWith(color: appColors(context).primary),
              textAlign: TextAlign.center,
            ),
            const Spacing.tinyHeight(),
            Text(
              message ?? "",
              style: textTheme.textRegular,
              textAlign: TextAlign.center,
            ),
            const Spacing.mediumHeight(),
            button ??
                AppButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onDone != null) {
                      onDone!();
                    }
                  },
                  text: buttonText ?? "Continue",
                ),
            const Spacing.height(20),
          ],
        ),
      ),
    );
  }
}

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    this.onRetry,
    this.button,
  });
  final String? title, message, buttonText;
  final void Function()? onRetry;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 49.04,
            height: 3.85,
            decoration: ShapeDecoration(
              color: appColors(context).grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.19)),
            ),
          ),
          const Spacing.height(40),
          // Image.asset(AppImages.error, height: 150, width: 180),
          const Spacing.height(10),
          Text(
            title ?? "Error Occured!",
            style: textTheme.text2Bold,
            textAlign: TextAlign.center,
          ),
          const Spacing.tinyHeight(),
          Text(
            message ?? "",
            style: textTheme.text2,
            textAlign: TextAlign.center,
          ),
          const Spacing.height(40),
          button ??
              AppButton(
                onPressed: onRetry ?? () => Navigator.pop(context),
                text: buttonText ?? "Try Again",
                width: 160,
                height: 40,
              ),
          const Spacing.height(20),
        ],
      ),
    );
  }
}

class ErrorRow extends StatelessWidget {
  const ErrorRow({
    super.key,
    this.status = false,
    required this.error,
  });
  final bool status;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          margin: const EdgeInsets.only(right: 5, bottom: 4, top: 4),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: status ? const Color(0xFF0CAE0C) : Colors.black,
            ),
          ),
          child: status
              ? const Icon(
                  Icons.done,
                  color: Color(0xFF0CAE0C),
                  size: 9,
                )
              : null,
        ),
        Text(error),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.style,
    this.onTap,
    this.radius = 0,
  });
  final String title;
  final TextStyle? style;
  final void Function()? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: appColors(context).surface,
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        title: Text(title, style: style ?? textTheme(context).text1Bold.copyWith(fontSize: 15)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        trailing: const TileSuffix(),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  const BottomTab({
    super.key,
    required this.tabs,
    required this.value,
    required this.onSelected,
  });
  final List<String> tabs;
  final String value;
  final void Function(String value) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF1F1F1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: tabs
                  .map(
                    (e) => InkWell(
                      onTap: () => onSelected(e),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: e == value ? Colors.white : Colors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text(
                          e,
                          style: textTheme(context).text2SemiBold.copyWith(
                                color: e == value ? appColors(context).primary : appColors(context).black,
                              ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomListTile2 extends StatelessWidget {
  const CustomListTile2({
    super.key,
    this.initial,
    this.initialWidget,
    this.title,
    this.subtitle,
    this.trailing,
    this.hasInitial = true,
    this.vPadding,
    this.onTap,
  });
  final bool hasInitial;
  final String? initial;
  final Widget? initialWidget;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final double? vPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: vPadding ?? 24, horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3, color: Color(0xFFD9D9D9))),
        ),
        child: Row(
          children: [
            if (hasInitial) ...[
              Container(
                height: 36,
                width: 36,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: const OvalBorder(),
                  color: appColors(context).primary.withOpacity(0.1),
                ),
                child: initialWidget ??
                    Text(
                      "$initial",
                      style: textTheme(context).text2Medium.copyWith(color: appColors(context).primary),
                    ),
              ),
              const Spacing.width(12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: textTheme(context).textMedium.copyWith(fontSize: 14.7),
                  ),
                  if (subtitle != null)
                    Text(
                      "$subtitle",
                      style: textTheme(context).text1Regular.copyWith(
                            fontSize: 14.7,
                            color: appColors(context).onSurface.withOpacity(0.6),
                          ),
                    ),
                ],
              ),
            ),
            if (trailing != null) trailing!
          ],
        ),
      ),
    );
  }
}
