// ignore_for_file: library_private_types_in_public_api

import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core/enums/enums.dart';

class AppOverlay extends StatefulWidget {
  const AppOverlay({
    super.key,
    required this.child,
    required this.controller,
    this.messagePadding,
  });
  final Widget child;
  final OverLayLoaderController controller;
  final EdgeInsetsGeometry? messagePadding;

  @override
  State<AppOverlay> createState() => _AppOverlayState();

  static _AppOverlayState of(BuildContext context) {
    final _AppOverlayState? result = context.findAncestorStateOfType<_AppOverlayState>();
    if (result != null) return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'AppOverlay.of() called with a context that does not contain a AppOverlay.',
      ),
      ErrorDescription(
        'No AppOverlay ancestor could be found starting from the context that was passed to AppOverlay.of(). '
        'This usually happens when the context provided is from the same StatefulWidget as that '
        'whose build function actually creates the AppOverlay widget being sought.',
      ),
      context.describeElement('The context used was'),
    ]);
  }
}

class _AppOverlayState extends State<AppOverlay> {
  OverLayLoaderController get controller => widget.controller;

  void showMessage({
    required String message,
    String? title,
    required MessageType messageType,
  }) {
    return controller.showMessage(
      message: message,
      messageType: messageType,
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        widget.child,
        ValueListenableBuilder<(OverLayType, _MessageText?)>(
          valueListenable: widget.controller._valueNotifier,
          builder: (context, listen, child) {
            if (listen.$1 == OverLayType.loader) {
              return Positioned.fill(
                child: Material(
                  color: Colors.black.withOpacity(.5),
                  child: Center(
                      child: Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Directionality(
                        textDirection: TextDirection.ltr,
                        child: SpinKitFadingCircle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        listen.$2?.message ?? "Please wait...",
                        style: Theme.of(context).textTheme.text1SemiBold.copyWith(color: Colors.white),
                        textDirection: TextDirection.ltr,
                      ),
                      const SizedBox(height: 8),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextButton(
                          onPressed: () => controller.removeOverLay(),
                          child: Text(
                            "Cancel",
                            style: Theme.of(context)
                                .textTheme
                                .text1SemiBold
                                .copyWith(color: const Color(0xFFE83D1E), fontSize: 13),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              );
            } else if (listen.$1 == OverLayType.message) {
              return SafeArea(
                child: Container(
                  padding: widget.messagePadding ?? const EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: -20, end: 0),
                    curve: Curves.easeInOut,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, value),
                        child: _messageWidget(
                          messageIcon: switch (listen.$2?.messageType) {
                            MessageType.error => BIcons.information,
                            MessageType.success => BIcons.tick_circle,
                            MessageType.warning => BIcons.danger,
                            _ => BIcons.info_circle
                          },
                          messageText: listen.$2!,
                          messageColor: switch (listen.$2?.messageType) {
                            MessageType.error => const Color(0xFFE83D1E),
                            MessageType.success => const Color(0xFF008000),
                            MessageType.warning => Colors.orange,
                            _ => const Color(0xFF094EFF)
                          },
                          onClose: () {
                            controller.removeOverLay();
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _messageWidget({
    required _MessageText messageText,
    required IconData messageIcon,
    required Color messageColor,
    required VoidCallback onClose,
  }) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: messageColor),
      ),
      // color: messageText.messageType == MessageType.error ? const Color(0XFFFFF2F2) : const Color(0XFFDCF3EB),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 63.0,
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(messageIcon, size: 28, textDirection: TextDirection.ltr, color: messageColor),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (messageText.title != null)
                    Text(
                      messageText.title!,
                      style: Theme.of(context).textTheme.text1SemiBold.copyWith(
                            color: messageColor,
                            fontSize: 13,
                          ),
                      textDirection: TextDirection.ltr,
                    ),
                  Text(
                    messageText.message,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.text1Regular.copyWith(
                          color: messageColor,
                          fontSize: 13,
                        ),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: InkWell(
                onTap: onClose,
                child: const Icon(
                  BIcons.close_circle,
                  size: 20,
                  color: Colors.black,
                  textDirection: TextDirection.ltr,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OverLayLoaderController {
  final ValueNotifier<(OverLayType, _MessageText?)> _valueNotifier = ValueNotifier((OverLayType.none, null));

  void showLoader({String? message}) {
    _valueNotifier.value = ((
      OverLayType.loader,
      _MessageText(
        message: message ?? "Please wait",
        messageType: MessageType.info,
      )
    ));
  }

  void showMessage({
    required String message,
    String? title,
    required MessageType messageType,
  }) {
    _valueNotifier.value = ((
      OverLayType.message,
      _MessageText(
        title: title,
        message: message,
        messageType: messageType,
      )
    ));
    Future.delayed(const Duration(seconds: 5), () {
      removeOverLay();
    });
  }

  void removeOverLay() {
    _valueNotifier.value = ((OverLayType.none, null));
  }

  void dispose() {
    _valueNotifier.dispose();
  }
}

class _MessageText {
  final String? title;
  final String message;
  final MessageType messageType;
  _MessageText({
    this.title,
    required this.message,
    required this.messageType,
  });
}
