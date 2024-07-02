import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/utils/utils.dart';

class AppCircularLoader extends StatelessWidget {
  const AppCircularLoader({
    super.key,
    this.color = Colors.white,
    this.size = 10,
  });
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        animating: true,
        radius: size,
      ),
    );
  }

  static void showProgressOverlay(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black38,
      builder: (ctx) => Theme(
        data: ThemeData(useMaterial3: false),
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: PopScope(
            canPop: false,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppCircularLoader(size: 15),
                const Spacing.tinyHeight(),
                Text(
                  "Please wait...",
                  style: textTheme.textSemiBold.copyWith(fontSize: 16, color: Colors.white),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  static void closeOverlay(BuildContext context) {
    Navigator.pop(context);
  }
}

class SingleLineListLoader extends StatelessWidget {
  const SingleLineListLoader({
    super.key,
    this.length,
    this.itemHeight,
    this.itemWidth,
    this.itemMargin,
  });
  final int? length;
  final double? itemHeight, itemWidth, itemMargin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(
          length ?? 5,
          (index) => Container(
            margin: EdgeInsets.only(bottom: itemMargin ?? 15),
            height: itemHeight ?? 45,
            width: itemWidth ?? double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLoader extends StatelessWidget {
  final int? itemCount;
  const CustomLoader({super.key, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount ?? 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            period: const Duration(milliseconds: 1500),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                dense: true,
                minLeadingWidth: 0,
                horizontalTitleGap: 8,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: const CircleAvatar(radius: 26),
                title: cont(right: 80),
                subtitle: cont(right: 140),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cont(),
                    const SizedBox(height: 6),
                    cont(right: 10.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cont({left = 0.0, right = 0.0}) {
    return Container(
      height: 8,
      width: 50,
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

Widget box({
  double height = double.infinity,
  double width = double.infinity,
  double borderRadius = 8,
  bool rounded = false,
  Widget? child,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: rounded ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: !rounded ? BorderRadius.circular(borderRadius) : null,
    ),
    child: child,
  );
}
