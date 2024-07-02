import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:flutter/material.dart';

import '../core/utils/utils.dart';

class EmptyErrorWidget extends StatelessWidget {
  const EmptyErrorWidget({
    super.key,
    this.image,
    this.title,
    this.message,
    this.bottom,
    this.titleStyle,
    this.messageStyle,
  });
  final String? image;
  final String? title;
  final String? message;
  final Widget? bottom;
  final TextStyle? titleStyle, messageStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacing.height(50),
          Image.asset(imgPath(image ?? "empty-record.png"), height: 200),
          const Spacing.largeHeight(),
          Text(
            title ?? "No records available yet",
            style: titleStyle ?? textTheme(context).text2SemiBold.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const Spacing.smallHeight(),
          Text(
            message ?? "Assets added will be catalogued here,\nadd now to get started.",
            style: messageStyle ?? textTheme(context).textRegular.copyWith(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const Spacing.largeHeight(),
          if (bottom != null) bottom!,
        ],
      ),
    );
  }
}
