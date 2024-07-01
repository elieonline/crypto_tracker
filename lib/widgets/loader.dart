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

class ItemLoader extends StatelessWidget {
  const ItemLoader({
    super.key,
    this.itemHeight,
    this.itemWidth,
  });
  final double? itemHeight, itemWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: itemHeight ?? 45,
        width: itemWidth ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ReferralLoader extends StatelessWidget {
  const ReferralLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  box(height: 28, width: 28, rounded: true),
                  box(height: 28, width: 28, rounded: true),
                  box(height: 28, width: 28, rounded: true),
                  box(height: 28, width: 28, rounded: true),
                ],
              ),
              box(height: 25, width: 75),
            ],
          ),
          const Spacing.height(35),
          box(height: 10, width: 80, borderRadius: 2),
          const Spacing.height(3),
          box(height: 5, width: double.maxFinite),
          const Spacing.height(5),
          Center(child: box(height: 8, width: 200, borderRadius: 2)),
        ],
      ),
    );
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.msg = "The Info will be displayed shortly",
  });
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box(height: 20, width: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          box(height: 20, width: 20),
                          const Spacing.width(15),
                          box(height: 20, width: 20),
                          const Spacing.width(15),
                          box(height: 20, width: 20),
                        ],
                      ),
                    ],
                  ),
                  const Spacing.height(35),

                  //avatar
                  Row(children: [const Spacing.width(15), box(height: 50, width: 50, rounded: true)]),
                  const Spacing.height(40),

                  //line3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      box(height: 30, width: 50),
                      const Spacing.width(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          box(height: 30, width: 30),
                          const Spacing.width(35),
                          box(height: 20, width: 20),
                        ],
                      ),
                    ],
                  ),
                  const Spacing.height(20),

                  //line4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box(height: 40, width: 120),
                      const Spacing.width(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          box(height: 30, width: 30),
                          const Spacing.width(25),
                          box(height: 40, width: 30),
                        ],
                      ),
                    ],
                  ),
                  const Spacing.height(20),

                  //line5
                  box(height: 40, width: 180),
                  const Spacing.height(25),

                  //line6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box(height: 40, width: 50),
                      box(height: 40, width: 30),
                      box(height: 40, width: 30),
                      box(height: 40, width: 30),
                      box(height: 40, width: 50),
                      box(height: 40, width: 50),
                    ],
                  ),
                  const Spacing.height(56),
                ],
              ),
            ),
            //info box
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    msg,
                  ),
                  const Spacing.height(10),
                ],
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacing.height(35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: box(height: 35)),
                      const Spacing.width(20),
                      box(height: 20, width: 20),
                      const Spacing.width(10),
                      box(height: 35, width: 80),
                      box(height: 25, width: 60),
                    ],
                  ),
                  const Spacing.height(15),
                  Row(
                    children: [
                      box(height: 20, width: 20),
                      const Spacing.width(10),
                      box(height: 20, width: 60),
                    ],
                  ),
                  const Spacing.height(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          box(height: 15, width: 15),
                          const Spacing.width(10),
                          box(height: 25, width: 160),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          box(height: 25, width: 20),
                          const Spacing.width(30),
                          box(height: 25, width: 25),
                        ],
                      ),
                    ],
                  ),
                  const Spacing.height(30),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(child: box(height: 35)),
                            const Spacing.width(15),
                            Expanded(child: box(height: 35)),
                            const Spacing.width(15),
                            Expanded(child: box(height: 35)),
                          ],
                        ),
                      ),
                      const Spacing.width(50),
                      Expanded(child: box(height: 35))
                    ],
                  ),
                  const Spacing.height(50),
                  box(height: 160),
                ],
              ),
            ),
          ],
        ),
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
