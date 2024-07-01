import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

class AppButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final double cornerRadius;
  final bool isEnabled;
  final bool isLoading;
  final AppButtonStyle? buttonStyle;
  final bool hasIcon;
  final String? icon;
  final VoidCallback onPressed;

  const AppButton({
    this.height = AppButtonStyle.buttonDefaultHeight,
    this.width = AppButtonStyle.buttonDefaultWidth,
    this.isEnabled = AppButtonStyle.buttonIsEnable,
    this.isLoading = AppButtonStyle.buttonIsLoading,
    this.cornerRadius = AppButtonStyle.buttonCornerRadius,
    this.buttonStyle,
    required this.text,
    this.hasIcon = false,
    this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButton();
}

class _AppButton extends State<AppButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    AppButtonStyle buttonStyle = widget.buttonStyle ?? AppButtonStyle.primary(context);
    return GestureDetector(
      onTap: isActive() ? widget.onPressed : null,
      onTapDown: (_) {
        showClickEffect(true);
      },
      onTapUp: (_) {
        showClickEffect(false);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: buttonStyle.borderColor,
          ),
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          color: !widget.isEnabled || widget.isLoading ? buttonStyle.disabledBackgroundColor : buttonStyle.color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!widget.isLoading)
              FittedBox(
                child: widget.hasIcon
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            widget.icon!,
                            fit: BoxFit.scaleDown,
                          ),
                          const Spacing.smallWidth(),
                          Text(
                            widget.text,
                            style: (buttonStyle.textStyle ?? Theme.of(context).textTheme.text2SemiBold).copyWith(
                              color: widget.isEnabled ? buttonStyle.textColor : buttonStyle.disabledTextColor,
                            ),
                          )
                        ],
                      )
                    : Text(
                        widget.text,
                        style: (buttonStyle.textStyle ?? Theme.of(context).textTheme.text2SemiBold).copyWith(
                          color: widget.isEnabled ? buttonStyle.textColor : buttonStyle.disabledTextColor,
                        ),
                      ),
              ),
            if (widget.isLoading) ...[const SizedBox(width: 20), const AppCircularLoader()],
          ],
        ),
      ),
    );
  }

  void showClickEffect(bool show) {
    if (isActive()) {
      setState(() {
        isClicked = show;
      });
    }
  }

  bool isActive() => widget.isEnabled
      ? widget.isLoading
          ? false
          : true
      : false;
}
