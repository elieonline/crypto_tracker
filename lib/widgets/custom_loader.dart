import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
    this.size,
    this.message,
  });
  final double? size;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            color: appColors(context).primary,
            size: size ?? 50,
          ),
          const Spacing.smallHeight(),
          Text(
            message ?? "Fetching details...",
            style: textTheme(context).text1Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
